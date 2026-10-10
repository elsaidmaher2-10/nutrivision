import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/router/route_names.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_logo.dart';
import '../../../../../core/widgets/app_scaffold.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.surfaceLight,
      appBar: AppBar(
        title: Text(
          AppStrings.homeTitle,
          style: AppTextStyles.titleLarge.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              size: AppSizes.iconMd,
              color: AppColors.textPrimary,
            ),
            tooltip: 'الإشعارات',
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings_outlined,
              size: AppSizes.iconMd,
              color: AppColors.textPrimary,
            ),
            tooltip: 'الإعدادات',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: AppSizes.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Welcome section
              _buildWelcomeSection(context),

              SizedBox(height: AppSizes.spacing3xl),

              // Quick stats placeholder
              _buildQuickStats(context),

              SizedBox(height: AppSizes.spacing3xl),

              // Quick actions
              _buildQuickActions(context),

              SizedBox(height: AppSizes.spacing3xl),

              // Placeholder notice
              _buildPlaceholderNotice(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildWelcomeSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.spacingXl),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.primary,
            AppColors.deepGreen,
          ],
        ),
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
            spreadRadius: -4,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'مرحباً بك في',
                  style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.white.withValues(alpha: 0.9),
                  ),
                ),
                SizedBox(height: AppSizes.spacingXs),
                Text(
                  AppStrings.appName,
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: AppSizes.spacingMd),
                Text(
                  'مساعدك الذكي للتغذية والصحة',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.white.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
          AppLogoSmall(size: AppSizes.logoLg, color: AppColors.white),
        ],
      ),
    );
  }

  Widget _buildQuickStats(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ملخص اليوم',
          style: AppTextStyles.titleLarge.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: AppSizes.spacingLg),
        Row(
          children: [
            _buildStatCard(
              context,
              title: 'السعرات',
              value: '0',
              unit: 'كcal',
              icon: Icons.local_fire_department,
              iconColor: AppColors.orange,
              backgroundColor: AppColors.orange.withValues(alpha: 0.1),
            ),
            SizedBox(width: AppSizes.spacingMd),
            _buildStatCard(
              context,
              title: 'البروتين',
              value: '0',
              unit: 'جم',
              icon: Icons.fitness_center,
              iconColor: AppColors.primary,
              backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            ),
            SizedBox(width: AppSizes.spacingMd),
            _buildStatCard(
              context,
              title: 'الكربوهيدرات',
              value: '0',
              unit: 'جم',
              icon: Icons.grain,
              iconColor: AppColors.teal,
              backgroundColor: AppColors.teal.withValues(alpha: 0.1),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String title,
    required String value,
    required String unit,
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(AppSizes.spacingLg),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: AppColors.textPrimary.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(AppSizes.radiusFull),
              ),
              child: Center(
                child: Icon(icon, color: iconColor, size: AppSizes.iconLg),
              ),
            ),
            SizedBox(height: AppSizes.spacingMd),
            Text(
              value,
              style: AppTextStyles.headlineMedium.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              unit,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            SizedBox(height: AppSizes.spacingXs),
            Text(
              title,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'إجراءات سريعة',
          style: AppTextStyles.titleLarge.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: AppSizes.spacingLg),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: AppSizes.spacingMd,
          crossAxisSpacing: AppSizes.spacingMd,
          childAspectRatio: 1.1,
          children: [
            _buildActionCard(
              context,
              title: 'تحليل وجبة',
              subtitle: 'تصوير وتحليل',
              icon: Icons.camera_alt_outlined,
              iconColor: AppColors.primary,
              backgroundColor: AppColors.primary.withValues(alpha: 0.1),
              onTap: () {},
            ),
            _buildActionCard(
              context,
              title: 'إضافة وجبة',
              subtitle: 'تسجيل يدوي',
              icon: Icons.add_circle_outline,
              iconColor: AppColors.teal,
              backgroundColor: AppColors.teal.withValues(alpha: 0.1),
              onTap: () {},
            ),
            _buildActionCard(
              context,
              title: 'الوصفات',
              subtitle: 'أطباق صحية',
              icon: Icons.menu_book_outlined,
              iconColor: AppColors.orange,
              backgroundColor: AppColors.orange.withValues(alpha: 0.1),
              onTap: () {},
            ),
            _buildActionCard(
              context,
              title: 'الأهداف',
              subtitle: 'تتبع التقدم',
              icon: Icons.flag_outlined,
              iconColor: AppColors.deepGreen,
              backgroundColor: AppColors.deepGreen.withValues(alpha: 0.1),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        child: Container(
          padding: EdgeInsets.all(AppSizes.spacingLg),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                color: AppColors.textPrimary.withValues(alpha: 0.04),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                ),
                child: Center(
                  child: Icon(icon, color: iconColor, size: AppSizes.iconXl),
                ),
              ),
              SizedBox(height: AppSizes.spacingMd),
              Text(
                title,
                style: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSizes.spacingXs),
              Text(
                subtitle,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholderNotice(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.spacingXl),
      decoration: BoxDecoration(
        color: AppColors.softMint,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Icon(
            Icons.construction_outlined,
            size: AppSizes.icon3xl,
            color: AppColors.primary,
          ),
          SizedBox(height: AppSizes.spacingLg),
          Text(
            'شاشة الرئيسية قيد التطوير',
            style: AppTextStyles.titleLarge.copyWith(
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSizes.spacingMd),
          Text(
            'سيتم إضافة لوحة تحكم التغذية الكاملة، تتبع الوجبات، تحليل الطعام بالذكاء الاصطناعي، الوصفات الصحية، وإدارة الأهداف في الإصدارات القادمة.',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSizes.spacingXl),
          AppButton(
            variant: AppButtonVariant.primary,
            label: 'تسجيل الخروج',
            onPressed: () => _handleSignOut(context),
            fullWidth: false,
            leadingIcon: Icon(Icons.logout, size: AppSizes.iconSm, color: AppColors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return NavigationBar(
      selectedIndex: 0,
      onDestinationSelected: (index) {},
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'الرئيسية',
        ),
        NavigationDestination(
          icon: Icon(Icons.camera_alt_outlined),
          selectedIcon: Icon(Icons.camera_alt),
          label: 'تحليل',
        ),
        NavigationDestination(
          icon: Icon(Icons.restaurant_menu_outlined),
          selectedIcon: Icon(Icons.restaurant_menu),
          label: 'الوجبات',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: 'الملف',
        ),
      ],
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      height: 72,
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 8,
    );
  }

  Future<void> _handleSignOut(BuildContext context) async {
    // Clear auth state
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setBool('is_authenticated', false);

    if (context.mounted) {
      context.go(RouteNames.welcome);
    }
  }
}