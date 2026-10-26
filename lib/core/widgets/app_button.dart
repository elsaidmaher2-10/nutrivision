import 'package:flutter/material.dart';
import 'nutri_button.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.isOutlined = false,
    this.icon,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return NutriButton(
      label: text,
      onPressed: onPressed,
      isLoading: isLoading,
      isOutlined: isOutlined,
      icon: icon,
    );
  }
}
