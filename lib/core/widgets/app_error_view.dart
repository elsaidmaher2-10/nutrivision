import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../constants/app_strings.dart';
import '../constants/app_text_styles.dart';
import 'app_button.dart';
import 'app_loading.dart';

class AppErrorView extends StatelessWidget {
  const AppErrorView({
    super.key,
    this.message = AppStrings.error,
    this.title,
    this.icon = Icons.error_outline,
    this.iconColor = AppColors.error,
    this.onRetry,
    this.retryLabel = AppStrings.retry,
    this.showRetry = true,
    this.onDismiss,
    this.dismissLabel = AppStrings.close,
    this.showDismiss = false,
    this.padding = AppSizes.padding2xl,
    this.iconSize = AppSizes.icon4xl,
    this.textAlign = TextAlign.center,
  });

  final String message;
  final String? title;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onRetry;
  final String retryLabel;
  final bool showRetry;
  final VoidCallback? onDismiss;
  final String dismissLabel;
  final bool showDismiss;
  final EdgeInsetsGeometry padding;
  final double iconSize;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(AppSizes.spacingLg),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppSizes.radiusFull),
            ),
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
          ),
          SizedBox(height: AppSizes.spacingLg),
          if (title != null) ...[
            Text(
              title!,
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
              textAlign: textAlign,
            ),
            SizedBox(height: AppSizes.spacingSm),
          ],
          Text(
            message,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
            textAlign: textAlign,
          ),
          if (showRetry || showDismiss) ...[
            SizedBox(height: AppSizes.spacingXl),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (showDismiss)
                  AppButton(
                    variant: AppButtonVariant.text,
                    label: dismissLabel,
                    onPressed: onDismiss,
                    fullWidth: false,
                  ),
                if (showDismiss && showRetry)
                  SizedBox(width: AppSizes.spacingMd),
                if (showRetry)
                  AppButton(
                    variant: AppButtonVariant.primary,
                    label: retryLabel,
                    onPressed: onRetry,
                    fullWidth: false,
                    leadingIcon: Icon(Icons.refresh, size: AppSizes.iconSm),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class AppErrorViewFullScreen extends StatelessWidget {
  const AppErrorViewFullScreen({
    super.key,
    this.message = AppStrings.error,
    this.title,
    this.icon = Icons.error_outline,
    this.iconColor = AppColors.error,
    this.onRetry,
    this.retryLabel = AppStrings.retry,
    this.showRetry = true,
    this.backgroundColor,
    this.iconSize = 96,
  });

  final String message;
  final String? title;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onRetry;
  final String retryLabel;
  final bool showRetry;
  final Color? backgroundColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: backgroundColor ?? colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: AppSizes.screenPadding,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.6,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(AppSizes.spacingXl),
                    decoration: BoxDecoration(
                      color: iconColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                    ),
                    child: Icon(
                      icon,
                      size: iconSize,
                      color: iconColor,
                    ),
                  ),
                  SizedBox(height: AppSizes.spacing2xl),
                  if (title != null) ...[
                    Text(
                      title!,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: AppSizes.spacingMd),
                  ],
                  Text(
                    message,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (showRetry) ...[
                    SizedBox(height: AppSizes.spacing2xl),
                    AppButton(
                      variant: AppButtonVariant.primary,
                      label: retryLabel,
                      onPressed: onRetry,
                      leadingIcon: Icon(Icons.refresh, size: AppSizes.iconMd),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppEmptyState extends StatelessWidget {
  const AppEmptyState({
    super.key,
    this.title = 'لا توجد بيانات',
    this.message = 'لم يتم العثور على أي محتوى',
    this.icon = Icons.inbox_outlined,
    this.iconColor = AppColors.textSecondary,
    this.iconSize = AppSizes.icon4xl,
    this.actionLabel,
    this.onAction,
    this.actionIcon,
    this.padding = AppSizes.padding2xl,
    this.showIllustration = true,
  });

  final String title;
  final String message;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final String? actionLabel;
  final VoidCallback? onAction;
  final IconData? actionIcon;
  final EdgeInsetsGeometry padding;
  final bool showIllustration;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showIllustration) ...[
            Container(
              padding: EdgeInsets.all(AppSizes.spacingXl),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppSizes.radiusFull),
              ),
              child: Icon(
                icon,
                size: iconSize,
                color: iconColor,
              ),
            ),
            SizedBox(height: AppSizes.spacingLg),
          ],
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSizes.spacingSm),
          Text(
            message,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          if (actionLabel != null && onAction != null) ...[
            SizedBox(height: AppSizes.spacingXl),
            AppButton(
              variant: AppButtonVariant.primary,
              label: actionLabel!,
              onPressed: onAction,
              leadingIcon: actionIcon != null ? Icon(actionIcon, size: AppSizes.iconSm) : null,
              fullWidth: false,
            ),
          ],
        ],
      ),
    );
  }
}

class AppOfflineBanner extends StatelessWidget {
  const AppOfflineBanner({
    super.key,
    this.message = 'أنت غير متصل بالإنترنت',
    this.actionLabel = 'إعادة المحاولة',
    this.onAction,
    this.backgroundColor = AppColors.orange,
    this.textColor = AppColors.white,
    this.height = 48,
  });

  final String message;
  final String actionLabel;
  final VoidCallback? onAction;
  final Color backgroundColor;
  final Color textColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: backgroundColor,
      padding: EdgeInsetsDirectional.symmetric(horizontal: AppSizes.spacingLg),
      child: Row(
        children: [
          Icon(Icons.wifi_off, color: textColor, size: AppSizes.iconSm),
          SizedBox(width: AppSizes.spacingMd),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (onAction != null)
            TextButton(
              onPressed: onAction,
              style: TextButton.styleFrom(
                foregroundColor: textColor,
                padding: EdgeInsets.symmetric(horizontal: AppSizes.spacingMd, vertical: AppSizes.spacingXs),
                minimumSize: Size(0, 32),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                actionLabel,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
        ],
      ),
    );
  }
}