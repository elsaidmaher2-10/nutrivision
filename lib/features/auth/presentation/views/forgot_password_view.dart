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
import '../viewmodels/forgot_password_viewmodel.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgotPasswordViewModel>(
      create: (_) => ForgotPasswordViewModel(),
      child: const _ForgotPasswordViewContent(),
    );
  }
}

class _ForgotPasswordViewContent extends StatefulWidget {
  const _ForgotPasswordViewContent();

  @override
  State<_ForgotPasswordViewContent> createState() => _ForgotPasswordViewContentState();
}

class _ForgotPasswordViewContentState extends State<_ForgotPasswordViewContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ForgotPasswordViewModel>().addListener(_onViewModelChanged);
    });
  }

  void _onViewModelChanged() {
    final viewModel = context.read<ForgotPasswordViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotPasswordViewModel>(
      builder: (context, viewModel, child) {
        return AppAuthScaffold(
          backgroundColor: AppColors.surfaceLight,
          body: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header with back button
                _buildHeader(context),

                SizedBox(height: AppSizes.spacingXl),

                // Hero illustration
                _buildHeroSection(context),

                SizedBox(height: AppSizes.spacing2xl),

                // Content
                _buildContent(context),

                SizedBox(height: AppSizes.spacing2xl),

                // Form
                _buildForm(context, viewModel),

                const Spacer(),

                // Footer
                _buildFooter(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        // Back button
        IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: AppSizes.iconMd,
            color: AppColors.textSecondary,
          ),
          tooltip: 'رجوع',
        ),

        // Title
        Expanded(
          child: Text(
            AppStrings.forgotPasswordTitle,
            style: AppTextStyles.titleLarge.copyWith(
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        // Placeholder for alignment
        SizedBox(width: 48),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return AspectRatio(
      aspectRatio: 358 / 201.5,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.softMint,
              AppColors.surfaceLight,
              AppColors.warmCream,
            ],
          ),
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -40,
              right: -40,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withValues(alpha: 0.1),
                ),
              ),
            ),
            Positioned(
              bottom: -50,
              left: -50,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.teal.withValues(alpha: 0.1),
                ),
              ),
            ),
            // Lock icon with refresh
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.surfaceLight,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.lock_outline,
                        size: 48,
                        color: AppColors.primary.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.refresh,
                          size: 20,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: AppSizes.paddingHorizontalMd,
      child: Column(
        children: [
          Text(
            AppStrings.forgotPasswordSubtitle,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context, ForgotPasswordViewModel viewModel) {
    return Padding(
      padding: AppSizes.paddingHorizontalMd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Email field
          AppTextField(
            controller: viewModel.emailController,
            label: AppStrings.forgotPasswordEmailLabel,
            hint: AppStrings.forgotPasswordEmailHint,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            prefixIcon: Icon(Icons.email_outlined, size: AppSizes.iconMd, color: AppColors.textSecondary),
            validator: viewModel.validateEmail,
            autofillHints: const [AutofillHints.email],
            onSubmitted: (_) => _handleSendResetLink(context, viewModel),
          ),

          SizedBox(height: AppSizes.spacingXl),

          // Send button
          AppButton(
            variant: AppButtonVariant.primary,
            label: AppStrings.forgotPasswordSendButton,
            onPressed: viewModel.isLoading ? null : () => _handleSendResetLink(context, viewModel),
            isLoading: viewModel.isLoading,
            leadingIcon: viewModel.isLoading
                ? null
                : Icon(Icons.send, size: AppSizes.iconSm, color: AppColors.white),
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

          // Success message
          if (viewModel.error == null && !viewModel.isLoading && viewModel.emailController.text.isNotEmpty) ...[
            SizedBox(height: AppSizes.spacingMd),
            Container(
              padding: EdgeInsets.all(AppSizes.spacingMd),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle_outline, color: AppColors.primary, size: AppSizes.iconSm),
                  SizedBox(width: AppSizes.spacingSm),
                  Expanded(
                    child: Text(
                      'تم إرسال رابط استعادة كلمة المرور إلى بريدك الإلكتروني',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Padding(
      padding: AppSizes.paddingHorizontalMd,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.forgotPasswordBackToLogin,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(width: AppSizes.spacingXs),
          TextButton(
            onPressed: () => context.push(RouteNames.login),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryDark,
              padding: EdgeInsets.zero,
              minimumSize: Size(0, 32),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              AppStrings.loginButton,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryDark,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleSendResetLink(BuildContext context, ForgotPasswordViewModel viewModel) async {
    await viewModel.sendResetLink();
    // Don't navigate automatically - let user read the success message
  }
}