import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AuthActionButton extends StatelessWidget {
  final VoidCallback? onTap;
  const AuthActionButton({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.neonBlue, AppColors.darkBlue],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'ACCESS SECURE TERMINAL',
              style: AppStyles.medium16Black,
            ),
            Icon(Icons.arrow_forward, color: AppColors.black),
          ],
        ),
      ),
    );
  }

}