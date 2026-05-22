import 'package:catch_a_phish/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AuthTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const AuthTab({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: isSelected
              ? BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 1,
                  ),
                )
              : null,
          child: Text(
            title,
            style: TextStyle(
              inherit: false,
              color: AppColors.whiteColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}