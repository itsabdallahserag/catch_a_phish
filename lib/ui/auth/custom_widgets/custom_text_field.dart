import 'package:catch_a_phish/core/utils/app_colors.dart';
import 'package:catch_a_phish/core/utils/app_styles.dart';
import 'package:flutter/material.dart';


typedef Onvalidator = String? Function(String?)?;

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.borderSideColor = AppColors.primaryColor,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.keyboardType,
    required this.validator,
    this.obscureText = false,
    this.style,
    this.maxLines,
    required this.controller,
      this.cursorColor,
  });
  final Color borderSideColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final Onvalidator validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextStyle? style;
  final TextEditingController? controller;
  final int? maxLines;
  final Color? cursorColor ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: cursorColor ?? AppColors.whiteColor,
      maxLines: maxLines ?? 1,
      controller: controller,
      style: style ??  AppStyles.regular16PrimaryColor,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: buildOutLineInputBorder(
          borderSideColor: borderSideColor,
        ),
        focusedBorder: buildOutLineInputBorder(
          borderSideColor: borderSideColor,
        ),
        errorBorder: buildOutLineInputBorder(borderSideColor: AppColors.redColor),
        focusedErrorBorder: buildOutLineInputBorder(
          borderSideColor: AppColors.redColor,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle ?? AppStyles.regular16PrimaryColor,
        labelText: labelText,
        labelStyle: labelStyle,
      ),
    );
  }

  OutlineInputBorder buildOutLineInputBorder({required Color borderSideColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 1, color: borderSideColor),
    );
  }
}