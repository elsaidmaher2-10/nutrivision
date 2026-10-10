import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../constants/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.counterText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onEditingComplete,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.inputFormatters,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.style,
    this.semanticLabel,
    this.fillColor,
    this.filled = true,
    this.contentPadding,
    this.borderRadius,
    this.showCounter = false,
    this.autofillHints,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final String? counterText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode autovalidateMode;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final TextStyle? style;
  final String? semanticLabel;
  final Color? fillColor;
  final bool filled;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;
  final bool showCounter;
  final Iterable<String>? autofillHints;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;
  late FocusNode _focusNode;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _hasFocus = _focusNode.hasFocus;
    });
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final effectiveErrorText = widget.errorText;

    final InputDecoration decoration = InputDecoration(
      labelText: widget.label,
      hintText: widget.hint,
      helperText: widget.helperText,
      errorText: effectiveErrorText,
      counterText: widget.showCounter ? widget.counterText : null,
      prefixIcon: widget.prefixIcon != null
          ? Padding(
              padding: EdgeInsetsDirectional.only(start: AppSizes.spacingLg, end: AppSizes.spacingMd),
              child: widget.prefixIcon,
            )
          : null,
      suffixIcon: _buildSuffixIcon(context),
      filled: widget.filled,
      fillColor: widget.fillColor ?? (_hasFocus ? colorScheme.primary.withValues(alpha: 0.04) : colorScheme.surface),
      contentPadding: widget.contentPadding ??
          EdgeInsetsDirectional.symmetric(horizontal: AppSizes.spacingLg, vertical: AppSizes.spacingMd),
      border: _inputBorder(colorScheme.outline, widget.borderRadius),
      enabledBorder: _inputBorder(colorScheme.outline, widget.borderRadius),
      focusedBorder: _inputBorder(colorScheme.primary, widget.borderRadius, width: 2),
      errorBorder: _inputBorder(colorScheme.error, widget.borderRadius),
      focusedErrorBorder: _inputBorder(colorScheme.error, widget.borderRadius, width: 2),
      disabledBorder: _inputBorder(colorScheme.outlineVariant, widget.borderRadius),
      labelStyle: AppTextStyles.inputLabel.copyWith(color: colorScheme.onSurfaceVariant),
      hintStyle: AppTextStyles.inputHint.copyWith(color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6)),
      floatingLabelStyle: AppTextStyles.inputLabel.copyWith(color: colorScheme.primary),
      errorStyle: AppTextStyles.errorText,
      helperStyle: AppTextStyles.bodySmall.copyWith(color: colorScheme.onSurfaceVariant),
      counterStyle: AppTextStyles.bodySmall.copyWith(color: colorScheme.onSurfaceVariant),
      prefixIconColor: _hasFocus ? colorScheme.primary : colorScheme.onSurfaceVariant,
      suffixIconColor: _hasFocus ? colorScheme.primary : colorScheme.onSurfaceVariant,
      iconColor: colorScheme.onSurfaceVariant,
      hoverColor: colorScheme.primary.withValues(alpha: 0.04),
      focusColor: colorScheme.primary.withValues(alpha: 0.08),
      errorMaxLines: 3,
      alignLabelWithHint: widget.maxLines > 1,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      isDense: false,
    );

    return Semantics(
      label: widget.semanticLabel ?? widget.label,
      textField: true,
      enabled: widget.enabled,
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        obscureText: _obscureText,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        maxLength: widget.maxLength,
        maxLengthEnforcement: widget.maxLengthEnforcement,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onSubmitted,
        onTap: widget.onTap,
        onEditingComplete: widget.onEditingComplete,
        validator: widget.validator,
        autovalidateMode: widget.autovalidateMode,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        autofocus: widget.autofocus,
        inputFormatters: widget.inputFormatters,
        textAlign: widget.textAlign,
        textDirection: widget.textDirection ?? Directionality.of(context),
        style: widget.style ?? AppTextStyles.inputText,
        autofillHints: widget.autofillHints,
        decoration: decoration,
      ),
    );
  }

  Widget? _buildSuffixIcon(BuildContext context) {
    if (widget.obscureText) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          size: AppSizes.iconMd,
        ),
        onPressed: _toggleObscureText,
        tooltip: _obscureText ? 'إظهار كلمة المرور' : 'إخفاء كلمة المرور',
        padding: EdgeInsetsDirectional.only(end: AppSizes.spacingLg),
        constraints: BoxConstraints(minWidth: AppSizes.iconMd, minHeight: AppSizes.iconMd),
      );
    }

    if (widget.suffixIcon != null) {
      return Padding(
        padding: EdgeInsetsDirectional.only(end: AppSizes.spacingLg),
        child: widget.suffixIcon,
      );
    }

    return null;
  }

  OutlineInputBorder _inputBorder(Color color, double? radius, {double width = 1.0}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? AppSizes.radiusMd),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}