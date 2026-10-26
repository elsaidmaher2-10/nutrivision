import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'nutri_nav_bar_item.dart';
import 'nutri_scan_button.dart';

class NutriBottomNav extends StatelessWidget {
  const NutriBottomNav({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        boxShadow: [
          BoxShadow(color: Color(0x0F000000), blurRadius: 20, offset: Offset(0, -4)),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NutriNavBarItem(icon: Icons.home_rounded, label: 'الرئيسية', isSelected: currentIndex == 0, onTap: () => onTap(0)),
              NutriNavBarItem(icon: Icons.local_dining_rounded, label: 'وجباتي', isSelected: currentIndex == 1, onTap: () => onTap(1)),
              NutriScanButton(onTap: () => onTap(2)),
              NutriNavBarItem(icon: Icons.eco_rounded, label: 'بدائل', isSelected: currentIndex == 3, onTap: () => onTap(3)),
              NutriNavBarItem(icon: Icons.person_rounded, label: 'حسابي', isSelected: currentIndex == 4, onTap: () => onTap(4)),
            ],
          ),
        ),
      ),
    );
  }
}
