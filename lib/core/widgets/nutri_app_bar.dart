import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class NutriAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NutriAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.backgroundColor,
    this.showLogo = false,
  });

  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final Color? backgroundColor;
  final bool showLogo;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.background.withValues(alpha: 0.95),
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: centerTitle,
      leading: leading,
      title: titleWidget ??
          (showLogo
              ? _NutriLogoTitle()
              : title != null
                  ? Text(title!, style: const TextStyle(fontFamily: 'Cairo', fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.onSurface))
                  : null),
      actions: actions,
    );
  }
}

class _NutriLogoTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36, height: 36,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
          child: const Icon(Icons.restaurant, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 10),
        const Text('NutriVision', style: TextStyle(fontFamily: 'Cairo', fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.primary)),
      ],
    );
  }
}
