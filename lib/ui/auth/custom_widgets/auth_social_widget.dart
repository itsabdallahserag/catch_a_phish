import 'package:catch_a_phish/core/utils/app_colors.dart';
import 'package:catch_a_phish/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class AuthSocialWidget extends StatelessWidget {
  const AuthSocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.transparentBlack,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.greyColor, width: 1),
            ),
            child: Image.asset(AppImages.google, width: 24, height: 24),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.transparentBlack,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.greyColor, width: 1),
            ),
            child: Image.asset(AppImages.gitHub, width: 24, height: 24),
          ),
        ),
      ],
    );
  }
}