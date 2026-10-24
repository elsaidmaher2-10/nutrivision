import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_card.dart';

/// Advanced Meal Analysis Details designed from NutriVision Stitch export (nutrivision_6)
class MealAnalysisDetailsView extends StatelessWidget {
  const MealAnalysisDetailsView({
    super.key,
    this.mealName = 'طبق كشري مصري متوسط',
  });

  final String mealName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.onSurface),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'تفاصيل التحليل المتقدم',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColors.onSurface,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: AppColors.onSurface),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Meal Summary Card with AI Confidence
              _MealHeroSummaryCard(mealName: mealName),

              const SizedBox(height: 18),

              // Macro Breakdown Card
              const _MacrosBreakdownCard(),

              const SizedBox(height: 18),

              // Ingredients List Card
              const _IngredientsCard(),

              const SizedBox(height: 18),

              // Smart AI Nutritional Advice Card
              const _SmartAdviceCard(),

              const SizedBox(height: 28),

              // Save Action Button
              SizedBox(
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'تمت إضافة الوجبة إلى سجل اليوم بنجاح! 🥗',
                          style: TextStyle(fontFamily: 'Cairo'),
                        ),
                        backgroundColor: AppColors.primary,
                      ),
                    );
                    context.pop();
                  },
                  icon: const Icon(Icons.bookmark_add_rounded, size: 20),
                  label: const Text(
                    'حفظ في وجبات اليوم',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.onPrimary,
                    elevation: 4,
                    shadowColor: AppColors.primary.withValues(alpha: 0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 56,
                child: OutlinedButton.icon(
                  onPressed: () => context.push('/alternatives'),
                  icon: const Icon(Icons.auto_awesome, size: 18, color: AppColors.primary),
                  label: const Text(
                    'استكشف بدائل صحية لهذا الطبق',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.surfaceWhite,
                    side: const BorderSide(color: AppColors.primary, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _MealHeroSummaryCard extends StatelessWidget {
  const _MealHeroSummaryCard({required this.mealName});

  final String mealName;

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      padding: const EdgeInsets.all(18),
      borderRadius: BorderRadius.circular(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.softMint,
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.verified_rounded, color: AppColors.primary, size: 14),
                    SizedBox(width: 4),
                    Text(
                      'ثقة الذكاء الاصطناعي 96%',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.deepGreen,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'تم التحليل منذ دقيقتين',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.softMint,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Icon(
                    Icons.ramen_dining_rounded,
                    color: AppColors.primary,
                    size: 38,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _CategoryTag(label: 'غداء'),
                        const SizedBox(width: 6),
                        _CategoryTag(label: 'طاقة عالية', isSecondary: true),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      mealName,
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: AppColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'مع صلصة الطماطم الحارة ودقوس والثوم المقرمش',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: AppColors.surfaceContainer, height: 1),
          const SizedBox(height: 12),
          const Row(
            children: [
              Icon(Icons.local_fire_department_rounded, color: AppColors.primary, size: 20),
              SizedBox(width: 6),
              Text(
                '450',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(width: 4),
              Text(
                'سعرة حرارية مقدرة',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CategoryTag extends StatelessWidget {
  const _CategoryTag({required this.label, this.isSecondary = false});

  final String label;
  final bool isSecondary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: isSecondary ? AppColors.secondaryContainer : AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: isSecondary ? AppColors.onSecondaryContainer : AppColors.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _MacrosBreakdownCard extends StatelessWidget {
  const _MacrosBreakdownCard();

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      padding: const EdgeInsets.all(18),
      borderRadius: BorderRadius.circular(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'العناصر الغذائية الكبرى (الماكروز)',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppColors.onSurface,
                ),
              ),
              Text(
                'إجمالي 97 جم',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          _MacroRowItem(
            name: 'البروتين النباتي',
            grams: '28 جم',
            percentage: '25%',
            color: AppColors.primary,
            progress: 0.25,
          ),
          const SizedBox(height: 14),
          _MacroRowItem(
            name: 'الكربوهيدرات المعقدة',
            grams: '55 جم',
            percentage: '55%',
            color: AppColors.tertiaryContainer,
            progress: 0.55,
          ),
          const SizedBox(height: 14),
          _MacroRowItem(
            name: 'الدهون الصحية',
            grams: '14 جم',
            percentage: '20%',
            color: AppColors.secondary,
            progress: 0.20,
          ),
        ],
      ),
    );
  }
}

class _MacroRowItem extends StatelessWidget {
  const _MacroRowItem({
    required this.name,
    required this.grams,
    required this.percentage,
    required this.color,
    required this.progress,
  });

  final String name;
  final String grams;
  final String percentage;
  final Color color;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 5, backgroundColor: color),
                const SizedBox(width: 8),
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.onSurface,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  grams,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '($percentage)',
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(9999),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: AppColors.surfaceContainer,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}

class _IngredientsCard extends StatelessWidget {
  const _IngredientsCard();

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      padding: const EdgeInsets.all(18),
      borderRadius: BorderRadius.circular(20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'المكونات المكتشفة بالرؤية الحاسوبية',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: AppColors.onSurface,
            ),
          ),
          SizedBox(height: 14),
          _IngredientRow(name: 'أرز مصري بالشعرية', amount: '120 جم', calories: '140 سعرة'),
          Divider(color: AppColors.surfaceContainer, height: 16),
          _IngredientRow(name: 'عدس أسود (بجبة) مسلوق', amount: '80 جم', calories: '110 سعرة'),
          Divider(color: AppColors.surfaceContainer, height: 16),
          _IngredientRow(name: 'حمص الشام المسلوق', amount: '50 جم', calories: '75 سعرة'),
          Divider(color: AppColors.surfaceContainer, height: 16),
          _IngredientRow(name: 'صلصة طماطم بالكمون والخل', amount: '60 مل', calories: '45 سعرة'),
          Divider(color: AppColors.surfaceContainer, height: 16),
          _IngredientRow(name: 'بصل مقرمش محمص', amount: '20 جم', calories: '80 سعرة'),
        ],
      ),
    );
  }
}

class _IngredientRow extends StatelessWidget {
  const _IngredientRow({
    required this.name,
    required this.amount,
    required this.calories,
  });

  final String name;
  final String amount;
  final String calories;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppColors.onSurface,
              ),
            ),
            Text(
              amount,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 11,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        Text(
          calories,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}

class _SmartAdviceCard extends StatelessWidget {
  const _SmartAdviceCard();

  @override
  Widget build(BuildContext context) {
    return NutriCard(
      backgroundColor: const Color(0xFFFFF8E1),
      borderColor: AppColors.orange.withValues(alpha: 0.3),
      padding: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(16),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.tips_and_updates_rounded, color: AppColors.tertiaryContainer, size: 26),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'نصيحة غذائية ذكية',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.tertiaryContainer,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'لتقليل السعرات بنسبة 20%، اطلب تقليل البصل المقرمش واستبدال جزء من الأرز بمزيد من العدس الغني بالبروتين والألياف.',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12,
                    color: Color(0xFF5D4037),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
