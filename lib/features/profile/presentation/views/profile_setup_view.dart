import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/nutri_card.dart';

/// Personal Metrics & Goal Setup Screen designed from NutriVision Stitch export (nutrivision_15, nutrivision_3)
class ProfileSetupView extends StatefulWidget {
  const ProfileSetupView({super.key});

  @override
  State<ProfileSetupView> createState() => _ProfileSetupViewState();
}

class _ProfileSetupViewState extends State<ProfileSetupView> {
  String _selectedGoal = 'خسارة الوزن';
  String _selectedActivity = 'متوسط';
  final _weightController = TextEditingController(text: '68');
  final _heightController = TextEditingController(text: '165');
  final _ageController = TextEditingController(text: '26');

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _onSave() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم تحديث أهدافك وخطة التغذية بنجاح! 🎯', style: TextStyle(fontFamily: 'Cairo')),
        backgroundColor: AppColors.primary,
      ),
    );
    context.pop();
  }

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
          'القياسات والأهداف الغذائية',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColors.onSurface,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Metrics Section
              NutriCard(
                padding: const EdgeInsets.all(18),
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'القياسات الحالية',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _MetricInputField(
                            label: 'الوزن (كجم)',
                            controller: _weightController,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _MetricInputField(
                            label: 'الطول (سم)',
                            controller: _heightController,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _MetricInputField(
                            label: 'العمر',
                            controller: _ageController,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Goal Selection Card
              NutriCard(
                padding: const EdgeInsets.all(18),
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'الهدف الغذائي الأساسي',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 14),
                    _GoalOptionTile(
                      title: 'خسارة الوزن ونحت القوام',
                      subtitle: 'عجز سعرات صحي ومستدام مع الحفاظ على الكتلة العضلية',
                      icon: Icons.track_changes_rounded,
                      isSelected: _selectedGoal == 'خسارة الوزن',
                      onTap: () => setState(() => _selectedGoal = 'خسارة الوزن'),
                    ),
                    const SizedBox(height: 10),
                    _GoalOptionTile(
                      title: 'بناء العضلات والقوة',
                      subtitle: 'زيادة البروتين والطاقة لدعم التمارين والكتلة العضلية',
                      icon: Icons.fitness_center_rounded,
                      isSelected: _selectedGoal == 'بناء العضلات',
                      onTap: () => setState(() => _selectedGoal = 'بناء العضلات'),
                    ),
                    const SizedBox(height: 10),
                    _GoalOptionTile(
                      title: 'الحفاظ على الوزن والصحة العامة',
                      subtitle: 'توازن متكامل بين الماكروز لتحسين النشاط اليومي',
                      icon: Icons.balance_rounded,
                      isSelected: _selectedGoal == 'الحفاظ على الوزن',
                      onTap: () => setState(() => _selectedGoal = 'الحفاظ على الوزن'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Activity Level Card
              NutriCard(
                padding: const EdgeInsets.all(18),
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'مستوى النشاط البدني',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 14),
                    _ActivityChip(
                      label: 'خامل (قليل الحركة أو عمل مكتبي)',
                      isSelected: _selectedActivity == 'خامل',
                      onTap: () => setState(() => _selectedActivity = 'خامل'),
                    ),
                    const SizedBox(height: 8),
                    _ActivityChip(
                      label: 'متوسط (مشي أو تمارين 2-3 أيام في الأسبوع)',
                      isSelected: _selectedActivity == 'متوسط',
                      onTap: () => setState(() => _selectedActivity = 'متوسط'),
                    ),
                    const SizedBox(height: 8),
                    _ActivityChip(
                      label: 'نشط جداً (تمارين مكثفة 4-6 أيام في الأسبوع)',
                      isSelected: _selectedActivity == 'نشط',
                      onTap: () => setState(() => _selectedActivity = 'نشط'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Save Button
              SizedBox(
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: _onSave,
                  icon: const Icon(Icons.check_circle_outline_rounded, size: 20),
                  label: const Text(
                    'حفظ وتحديث الخطة',
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
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetricInputField extends StatelessWidget {
  const _MetricInputField({
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.onSurface,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.surfaceContainerLow,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

class _GoalOptionTile extends StatelessWidget {
  const _GoalOptionTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.softMint : AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
              size: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? AppColors.deepGreen : AppColors.onSurface,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 11,
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.outline,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityChip extends StatelessWidget {
  const _ActivityChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.softMint : AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
              color: isSelected ? AppColors.primary : AppColors.outline,
              size: 18,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                  color: isSelected ? AppColors.deepGreen : AppColors.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
