import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_app_bar.dart';
import '../widgets/alternatives_intro_banner.dart';
import '../widgets/alternative_item_card.dart';

class AlternativesView extends StatelessWidget {
  const AlternativesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: NutriAppBar(
        title: 'بدائل صحية ذكية',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AlternativesIntroBanner(),
              SizedBox(height: 16),
              AlternativeItemCard(
                name: 'معكرونة بالبشاميل الصحية',
                category: 'غداء رئيسي',
                traditionalCal: 750,
                healthyCal: 320,
                savedPct: 57,
                tip: 'استبدال الدقيق الأبيض بدقيق الشوفان، وحليب قليل الدسم ولحم مفروم قليل الدهن.',
              ),
              SizedBox(height: 12),
              AlternativeItemCard(
                name: 'كنافة صحية بجبنة عكّاوي لايت',
                category: 'حلوى شرقية',
                traditionalCal: 620,
                healthyCal: 240,
                savedPct: 61,
                tip: 'استخدام سمن بلدي قليل جداً مع سكر ستيفيا ومكسرات غير محمصة.',
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
