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
import '../viewmodels/register_viewmodel.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterViewModel>(
      create: (_) => RegisterViewModel(),
      child: const _RegisterViewContent(),
    );
  }
}

class _RegisterViewContent extends StatefulWidget {
  const _RegisterViewContent();

  @override
  State<_RegisterViewContent> createState() => _RegisterViewContentState();
}

class _RegisterViewContentState extends State<_RegisterViewContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RegisterViewModel>().addListener(_onViewModelChanged);
    });
  }

  void _onViewModelChanged() {
    final viewModel = context.read<RegisterViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterViewModel>(
      builder: (context, viewModel, child) {
        return AppAuthScaffold(
          backgroundColor: AppColors.surfaceLight,
          body: Form(
            key: viewModel.formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  _buildHeader(context),

                  SizedBox(height: AppSizes.spacingXl),

                  // Register form
                  _buildRegisterForm(context, viewModel),

                  SizedBox(height: AppSizes.spacingXl),

                  // Footer
                  _buildFooter(context, viewModel),
                ],
              ),
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

        SizedBox(height: AppSizes.spacingMd),

        // Title
        Text(
          AppStrings.registerTitle,
          style: AppTextStyles.heading1.copyWith(
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: AppSizes.spacingMd),

        // Subtitle
        Text(
          AppStrings.registerSubtitle,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildRegisterForm(BuildContext context, RegisterViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Name field
        AppTextField(
          controller: viewModel.nameController,
          label: AppStrings.registerNameLabel,
          hint: AppStrings.registerNameHint,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(Icons.person_outline, size: AppSizes.iconMd, color: AppColors.textSecondary),
          validator: viewModel.validateName,
          autofillHints: const [AutofillHints.name],
        ),

        SizedBox(height: AppSizes.spacingLg),

        // Email field
        AppTextField(
          controller: viewModel.emailController,
          label: AppStrings.registerEmailLabel,
          hint: AppStrings.registerEmailHint,
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
          label: AppStrings.registerPasswordLabel,
          hint: AppStrings.registerPasswordHint,
          obscureText: viewModel.obscurePassword,
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(Icons.lock_outline, size: AppSizes.iconMd, color: AppColors.textSecondary),
          validator: viewModel.validatePassword,
          autofillHints: const [AutofillHints.newPassword],
        ),

        SizedBox(height: AppSizes.spacingLg),

        // Confirm password field
        AppTextField(
          controller: viewModel.confirmPasswordController,
          label: AppStrings.registerConfirmPasswordLabel,
          hint: AppStrings.registerConfirmPasswordHint,
          obscureText: viewModel.obscureConfirmPassword,
          textInputAction: TextInputAction.done,
          prefixIcon: Icon(Icons.lock_outline, size: AppSizes.iconMd, color: AppColors.textSecondary),
          validator: viewModel.validateConfirmPassword,
          autofillHints: const [AutofillHints.newPassword],
          onSubmitted: (_) => _handleRegister(context, viewModel),
        ),

        SizedBox(height: AppSizes.spacingLg),

        // Terms and conditions checkbox
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              value: viewModel.agreeToTerms,
              onChanged: (value) => viewModel.setAgreeToTerms(value ?? false),
              activeColor: AppColors.primary,
              checkColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: AppSizes.spacingXs),
                child: RichText(
                  text: TextSpan(
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(text: AppStrings.registerTermsPrefix),
                      TextSpan(
                        text: AppStrings.registerTerms,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.primaryDark,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryDark,
                        ),
                      ),
                      TextSpan(text: AppStrings.registerAnd),
                      TextSpan(
                        text: AppStrings.registerPrivacy,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.primaryDark,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryDark,
                        ),
                      ),
                    ],
                  ),
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

        // Register button
        AppButton(
          variant: AppButtonVariant.primary,
          label: AppStrings.registerButton,
          onPressed: viewModel.isLoading ? null : () => _handleRegister(context, viewModel),
          isLoading: viewModel.isLoading,
          leadingIcon: viewModel.isLoading
              ? null
              : Icon(Icons.person_add, size: AppSizes.iconSm, color: AppColors.white),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context, RegisterViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.registerHasAccount,
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
            AppStrings.registerLogin,
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

  Future<void> _handleRegister(BuildContext context, RegisterViewModel viewModel) async {
    await viewModel.register();

    if (viewModel.error == null && context.mounted) {
      context.go(RouteNames.home);
    }
  }
}