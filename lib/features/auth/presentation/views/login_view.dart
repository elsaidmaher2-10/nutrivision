import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../app/router/route_names.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_scaffold.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../viewmodels/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (_) => LoginViewModel(),
      child: const _LoginViewContent(),
    );
  }
}

class _LoginViewContent extends StatefulWidget {
  const _LoginViewContent();

  @override
  State<_LoginViewContent> createState() => _LoginViewContentState();
}

class _LoginViewContentState extends State<_LoginViewContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoginViewModel>().addListener(_onViewModelChanged);
    });
  }

  void _onViewModelChanged() {
    final viewModel = context.read<LoginViewModel>();
    // Handle navigation after successful login
    // This would typically be done via GoRouter redirect
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, viewModel, child) {
        return AppAuthScaffold(
          backgroundColor: AppColors.surfaceLight,
          body: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                _buildHeader(context),

                SizedBox(height: AppSizes.spacing2xl),

                // Visual banner
                _buildVisualBanner(context),

                SizedBox(height: AppSizes.spacing2xl),

                // Login form
                _buildLoginForm(context, viewModel),

                SizedBox(height: AppSizes.spacingXl),

                // Footer
                _buildFooter(context, viewModel),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        // Back button
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: AppSizes.iconMd,
              color: AppColors.textSecondary,
            ),
            tooltip: 'رجوع',
          ),
        ),

        SizedBox(height: AppSizes.spacingLg),

        // Title
        Text(
          AppStrings.loginTitle,
          style: AppTextStyles.heading1.copyWith(
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: AppSizes.spacingMd),

        // Subtitle
        Text(
          AppStrings.loginSubtitle,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildVisualBanner(BuildContext context) {
    return AspectRatio(
      aspectRatio: 358 / 160,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary.withValues(alpha: 0.1),
              AppColors.teal.withValues(alpha: 0.1),
              AppColors.softMint,
            ],
          ),
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -60,
              right: -60,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withValues(alpha: 0.1),
                ),
              ),
            ),
            Positioned(
              bottom: -80,
              left: -80,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.teal.withValues(alpha: 0.1),
                ),
              ),
            ),
            Center(
              child: Icon(
                Icons.eco_outlined,
                size: 80,
                color: AppColors.primary.withValues(alpha: 0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context, LoginViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Email field
        AppTextField(
          controller: viewModel.emailController,
          label: AppStrings.loginEmailLabel,
          hint: AppStrings.loginEmailHint,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(Icons.email_outlined, size: AppSizes.iconMd, color: AppColors.textSecondary),
          validator: viewModel.validateEmail,
          autofillHints: const [AutofillHints.email],
        ),

        SizedBox(height: AppSizes.spacingLg),

        // Password field
        AppTextField(
          controller: viewModel.passwordController,
          label: AppStrings.loginPasswordLabel,
          hint: AppStrings.loginPasswordHint,
          obscureText: viewModel.obscurePassword,
          textInputAction: TextInputAction.done,
          prefixIcon: Icon(Icons.lock_outline, size: AppSizes.iconMd, color: AppColors.textSecondary),
          validator: viewModel.validatePassword,
          autofillHints: const [AutofillHints.password],
          onSubmitted: (_) => _handleLogin(context, viewModel),
        ),

        SizedBox(height: AppSizes.spacingMd),

        // Forgot password and Remember me
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Remember me checkbox
            Row(
              children: [
                Checkbox(
                  value: viewModel.rememberMe,
                  onChanged: (value) => viewModel.setRememberMe(value ?? false),
                  activeColor: AppColors.primary,
                  checkColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Text(
                  AppStrings.loginRememberMe,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),

            // Forgot password link
            TextButton(
              onPressed: () => context.push(RouteNames.forgotPassword),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryDark,
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 32),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                AppStrings.loginForgotPassword,
                style: AppTextStyles.linkText.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primaryDark,
                ),
              ),
            ),
          ],
        ),

        // Error message
        if (viewModel.error != null) ...[
          SizedBox(height: AppSizes.spacingMd),
          Container(
            padding: EdgeInsets.all(AppSizes.spacingMd),
            decoration: BoxDecoration(
              color: AppColors.error.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.error_outline, color: AppColors.error, size: AppSizes.iconSm),
                SizedBox(width: AppSizes.spacingSm),
                Expanded(
                  child: Text(
                    viewModel.error!,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.error,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],

        SizedBox(height: AppSizes.spacingXl),

        // Login button
        AppButton(
          variant: AppButtonVariant.primary,
          label: AppStrings.loginButton,
          onPressed: viewModel.isLoading ? null : () => _handleLogin(context, viewModel),
          isLoading: viewModel.isLoading,
          leadingIcon: viewModel.isLoading
              ? null
              : Icon(Icons.login, size: AppSizes.iconSm, color: AppColors.white),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context, LoginViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.loginNoAccount,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(width: AppSizes.spacingXs),
        TextButton(
          onPressed: () => context.push(RouteNames.register),
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryDark,
            padding: EdgeInsets.zero,
            minimumSize: Size(0, 32),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            AppStrings.loginSignUp,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryDark,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _handleLogin(BuildContext context, LoginViewModel viewModel) async {
    await viewModel.login();

    if (viewModel.error == null && context.mounted) {
      // Navigate to home after successful login
      context.go(RouteNames.home);
    }
  }
}