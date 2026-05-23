import 'package:flutter/material.dart';
import 'package:catch_a_phish/core/utils/app_colors.dart';

class AppStyles {
  static final TextStyle semiBold16White = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle regular12White = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
   static final TextStyle regular16PrimaryColor = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle medium12Blue = TextStyle(
    color: AppColors.blue,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
   static final TextStyle bold15Grey = TextStyle(
    color: AppColors.greyColor,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle medium16Black = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}