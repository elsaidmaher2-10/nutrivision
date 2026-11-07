# fix-flutter-remote.ps1
# Run from your Flutter project folder:
#   powershell -ExecutionPolicy Bypass -File .\fix-flutter-remote.ps1
#
# What it does:
#   1. Checks node, npm, git, flutter
#   2. Installs GitHub CLI (gh) via winget if missing
#   3. Logs you in to GitHub if needed
#   4. Checks the project has a GitHub remote
#   5. Updates flutter-remote to the latest version
#   6. Runs flutter-remote down, then up
#   7. Saves a redacted log (flutter-remote-log.txt) you can attach to a GitHub issue

$ErrorActionPreference = "Continue"
$LogFile = Join-Path (Get-Location) "flutter-remote-log.txt"

function Step($msg)  { Write-Host ""; Write-Host "==> $msg" -ForegroundColor Cyan }
function Ok($msg)    { Write-Host "  [OK]   $msg" -ForegroundColor Green }
function Warn($msg)  { Write-Host "  [WARN] $msg" -ForegroundColor Yellow }
function Fail($msg)  { Write-Host "  [FAIL] $msg" -ForegroundColor Red }
function Has($cmd)   { return [bool](Get-Command $cmd -ErrorAction SilentlyContinue) }
function Done($code) { Write-Host ""; Read-Host "Press Enter to close this window"; exit $code }

function Refresh-Path {
    $machine = [Environment]::GetEnvironmentVariable("Path", "Machine")
    $user    = [Environment]::GetEnvironmentVariable("Path", "User")
    $env:Path = "$machine;$user"
}

# ---------------------------------------------------------------
Step "1/6 Checking basic tools"
# ---------------------------------------------------------------
$missing = $false
foreach ($tool in @("node", "npm", "git", "flutter")) {
    if (Has $tool) { Ok "$tool found" }
    else { Fail "$tool not found on PATH"; $missing = $true }
}
if ($missing) {
    Fail "Install the missing tools above, open a new terminal, and run this script again."
    Done 1
}

if (-not (Test-Path "pubspec.yaml")) {
    Fail "pubspec.yaml not found. Run this script from your Flutter project root."
    Done 1
}
Ok "Flutter project detected"

# ---------------------------------------------------------------
Step "2/6 Checking GitHub CLI (gh)"
# ---------------------------------------------------------------
if (-not (Has "gh")) {
    Warn "gh not found. Installing with winget..."
    if (-not (Has "winget")) {
        Fail "winget not available. Install GitHub CLI manually from https://cli.github.com and re-run."
        Done 1
    }
    winget install --id GitHub.cli -e --accept-source-agreements --accept-package-agreements
    Refresh-Path
    if (-not (Has "gh")) {
        Fail "gh installed but not visible yet. Close this terminal, open a new one, and re-run the script."
        Done 1
    }
}
Ok "gh found"

# ---------------------------------------------------------------
Step "3/6 Checking GitHub login"
# ---------------------------------------------------------------
gh auth status *> $null
if ($LASTEXITCODE -ne 0) {
    Warn "Not logged in. Starting gh auth login..."
    Write-Host "  Copy the one-time code shown below into the browser page." -ForegroundColor Yellow
    gh auth login --hostname github.com --git-protocol https --web
    gh auth status *> $null
    if ($LASTEXITCODE -ne 0) {
        Fail "Login did not complete. Run 'gh auth login' manually and try again."
        Done 1
    }
}
Ok "Logged in to GitHub"

# ---------------------------------------------------------------
Step "4/6 Checking the project's GitHub remote"
# ---------------------------------------------------------------
$remote = git remote get-url origin 2>$null
if ($LASTEXITCODE -ne 0 -or -not $remote) {
    Warn "No git remote 'origin'. The project must be pushed to GitHub for the macOS runner to build it."
    Warn "Create one with:  gh repo create --source . --private --push"
}
elseif ($remote -notmatch "github\.com") {
    Warn "Remote is not GitHub: $remote"
}
else {
    Ok "Remote: $remote"
    $repo = ($remote -replace "^.*github\.com[:/]", "") -replace "\.git$", ""
    $vis = gh repo view $repo --json visibility --jq ".visibility" 2>$null
    if ($vis) {
        Ok "Repo visibility: $vis"
        if ($vis -eq "PRIVATE") {
            Warn "Private repo: free macOS runner minutes are limited and cost more per minute."
        }
    }
    $uncommitted = git status --porcelain
    if ($uncommitted) {
        Warn "You have uncommitted changes. If the tool builds from GitHub, commit and push first."
    }
}

# ---------------------------------------------------------------
Step "5/6 Updating flutter-remote"
# ---------------------------------------------------------------
npm i -g flutter-remote@latest
if ($LASTEXITCODE -ne 0) {
    Fail "npm install failed. Try running the terminal as Administrator."
    Done 1
}
Ok "flutter-remote version:"
npm ls -g flutter-remote --depth=0

# ---------------------------------------------------------------
Step "6/6 Restarting the session (down, then up)"
# ---------------------------------------------------------------
Warn "Stopping any old session..."
flutter-remote down 2>&1 | Out-Null

Warn "Starting a new session. Output is also saved to: $LogFile"
Write-Host "  Open the FULL link printed below, including anything after ? or #" -ForegroundColor Yellow
Write-Host ""

flutter-remote up 2>&1 | Tee-Object -FilePath $LogFile

# Redact tokens from the saved log so it is safe to paste in a GitHub issue
if (Test-Path $LogFile) {
    $text = Get-Content $LogFile -Raw
    $text = $text -replace "(?i)(token=)[^&\s""']+", '$1<REDACTED>'
    $text = $text -replace "(?i)(Bearer\s+)[A-Za-z0-9\-\._~\+/]+=*", '$1<REDACTED>'
    $text = $text -replace "gh[pousr]_[A-Za-z0-9]{20,}", "<REDACTED>"
    Set-Content -Path $LogFile -Value $text
    Write-Host ""
    Ok "Redacted log saved: $LogFile"
}

Write-Host ""
Write-Host "If the browser still shows 'Remote access is disabled' (403), the problem is inside the tool," -ForegroundColor Yellow
Write-Host "not your machine. Open an issue on the flutter-remote repo and attach flutter-remote-log.txt." -ForegroundColor Yellow

Done 0
