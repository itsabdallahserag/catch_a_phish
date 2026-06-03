import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AuthActionButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final List<Color> gradientColors;
  final Color borderColor;
  const AuthActionButton({super.key, required this.onTap, required this.child, required this.gradientColors,this.borderColor = AppColors.transparent});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: child,
      ),
    );
  }

}