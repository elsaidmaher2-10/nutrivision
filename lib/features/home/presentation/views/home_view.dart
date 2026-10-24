import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/calorie_progress_ring.dart';
import '../../../../../core/widgets/macro_progress_bar.dart';
import '../../../../../core/widgets/nutri_card.dart';

/// Main Home Dashboard designed from NutriVision Stitch export (nutrivision_9)
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedTabIndex = 0;

  void _onTabSelected(int index) {
    if (index == 2) {
      // Middle scanner button
      context.push('/scanner');
      return;
    }
    setState(() => _selectedTabIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const _HomeAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Greeting Section
              const _HomeGreetingSection(),

              const SizedBox(height: 20),

              // AI Meal Logger Hero Card
              _AiMealLoggerHeroCard(
                onStartScan: () => context.push('/scanner'),
              ),

              const SizedBox(height: 20),

              // Daily Calorie Progress Card
              const _DailyCalorieProgressCard(),

              const SizedBox(height: 24),

              // Today's Meals Timeline
              _TodayMealsSection(
                onMealTap: (mealName) {
                  context.push('/meal-details', extra: mealName);
                },
              ),

              const SizedBox(height: 80), // bottom bar spacing
            ],
          ),
        ),
      ),
      bottomNavigationBar: _HomeBottomNavBar(
        currentIndex: _selectedTabIndex,
        onTap: _onTabSelected,
      ),
    );
  }
}

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background.withValues(alpha: 0.95),
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            child: const Icon(Icons.restaurant, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 10),
          const Text(
            'NutriVision',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_rounded, color: AppColors.onSurfaceVariant),
          tooltip: 'الإشعارات',
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: GestureDetector(
            onTap: () => context.push('/profile-setup'),
            child: const CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.person, color: Colors.white, size: 20),
            ),
          ),
        ),
      ],
    );
  }
}

class _HomeGreetingSection extends StatelessWidget {
  const _HomeGreetingSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'أهلاً بك، سارة! 🌿',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: AppColors.onSurface,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'خطوة أصغر كل يوم تصنع فارقاً كبيراً في صحتك.',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.surfaceContainerHigh,
            boxShadow: const [
              BoxShadow(
                color: Color(0x0D000000),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: const Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.local_florist_rounded, color: AppColors.primary, size: 24),
              Positioned(
                top: 4,
                right: 4,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AiMealLoggerHeroCard extends StatelessWidget {
  const _AiMealLoggerHeroCard({required this.onStartScan});

  final VoidCallback onStartScan;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF21865B),
            Color(0xFF15563D),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x2621865B), // 0 4px 20px rgba(33,134,91,0.15)
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onStartScan,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.auto_awesome, color: Colors.white, size: 14),
                      SizedBox(width: 6),
                      Text(
                        'التحليل الذكي بالرؤية الحاسوبية',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'أضف وجبة جديدة بالذكاء الاصطناعي 📸✨',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'التقط صورة لطبقك ودع الذكاء الاصطناعي يحسب السعرات والعناصر الغذائية فوراً.',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 13,
                    color: Colors.white.withValues(alpha: 0.9),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'ابدأ التصوير الآن',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_rounded, size: 16, color: AppColors.primary),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DailyCalorieProgressCard extends StatelessWidget {
  const _DailyCalorieProgressCard();

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      padding: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.softMint,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.local_fire_department_rounded,
                      color: AppColors.primary,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'السعرات الحرارية اليومية',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.onSurface,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.softMint,
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: const Text(
                  'المتبقي 550',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1,450',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: AppColors.onSurface,
                    ),
                  ),
                  Text(
                    'من أصل 2,000 سعرة حرارية مستهدفة',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              CalorieProgressRing(
                consumedCalories: 1450,
                targetCalories: 2000,
                size: 78,
                strokeWidth: 8,
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: AppColors.surfaceContainer, height: 1),
          const SizedBox(height: 16),
          const Row(
            children: [
              Expanded(
                child: MacroProgressBar(
                  label: 'بروتين',
                  currentGrams: 85,
                  targetGrams: 120,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: MacroProgressBar(
                  label: 'كارب',
                  currentGrams: 160,
                  targetGrams: 210,
                  color: AppColors.teal,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: MacroProgressBar(
                  label: 'دهون',
                  currentGrams: 45,
                  targetGrams: 65,
                  color: AppColors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TodayMealsSection extends StatelessWidget {
  const _TodayMealsSection({required this.onMealTap});

  final ValueChanged<String> onMealTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'وجبات اليوم',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.onSurface,
              ),
            ),
            TextButton(
              onPressed: () => context.push('/meals-log'),
              child: const Text(
                'عرض السجل',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _MealCardItem(
          category: 'فطور',
          title: 'بيض مسلوق + خبز بلدي + جبنة قريش',
          calories: 380,
          time: '8:30 ص',
          icon: Icons.breakfast_dining_rounded,
          iconColor: AppColors.orange,
          onTap: () => onMealTap('فطور'),
        ),
        const SizedBox(height: 10),
        _MealCardItem(
          category: 'غداء',
          title: 'طبق كشري مصري متوسط مع دقوس',
          calories: 620,
          time: '2:15 م',
          icon: Icons.lunch_dining_rounded,
          iconColor: AppColors.primary,
          highlight: true,
          onTap: () => onMealTap('طبق كشري مصري متوسط'),
        ),
        const SizedBox(height: 10),
        _MealCardItem(
          category: 'سناك',
          title: 'تفاحة خضراء وحفنة مكسرات نيئة',
          calories: 170,
          time: '5:00 م',
          icon: Icons.coffee_rounded,
          iconColor: AppColors.teal,
          onTap: () => onMealTap('سناك'),
        ),
        const SizedBox(height: 10),
        _MealCardItem(
          category: 'عشاء',
          title: 'سلطة خضراء مع تونة وزيت زيتون',
          calories: 280,
          time: '8:45 م',
          icon: Icons.dinner_dining_rounded,
          iconColor: AppColors.deepGreen,
          onTap: () => onMealTap('عشاء'),
        ),
      ],
    );
  }
}

class _MealCardItem extends StatelessWidget {
  const _MealCardItem({
    required this.category,
    required this.title,
    required this.calories,
    required this.time,
    required this.icon,
    required this.iconColor,
    required this.onTap,
    this.highlight = false,
  });

  final String category;
  final String title;
  final int calories;
  final String time;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      padding: const EdgeInsets.all(14),
      borderRadius: BorderRadius.circular(16),
      borderColor: highlight ? AppColors.primary.withValues(alpha: 0.3) : null,
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainer,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        category,
                        style: const TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      time,
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 11,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.onSurface,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$calories',
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
              const Text(
                'سعرة',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(width: 6),
          const Icon(Icons.arrow_forward_ios_rounded, size: 12, color: AppColors.outlineVariant),
        ],
      ),
    );
  }
}

class _HomeBottomNavBar extends StatelessWidget {
  const _HomeBottomNavBar({
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        boxShadow: [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 20,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavBarItem(
                icon: Icons.home_rounded,
                label: 'الرئيسية',
                isSelected: currentIndex == 0,
                onTap: () => onTap(0),
              ),
              _NavBarItem(
                icon: Icons.local_dining_rounded,
                label: 'وجباتي',
                isSelected: currentIndex == 1,
                onTap: () {
                  onTap(1);
                  context.push('/meals-log');
                },
              ),
              _ScannerCentralButton(
                onTap: () => onTap(2),
              ),
              _NavBarItem(
                icon: Icons.eco_rounded,
                label: 'البدائل',
                isSelected: currentIndex == 3,
                onTap: () {
                  onTap(3);
                  context.push('/alternatives');
                },
              ),
              _NavBarItem(
                icon: Icons.person_rounded,
                label: 'حسابي',
                isSelected: currentIndex == 4,
                onTap: () {
                  onTap(4);
                  context.push('/profile-setup');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.primary : AppColors.outline;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScannerCentralButton extends StatelessWidget {
  const _ScannerCentralButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.35),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(
          Icons.camera_alt_rounded,
          color: Colors.white,
          size: 26,
        ),
      ),
    );
  }
}
