import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class FinalVerdict extends StatelessWidget {
  const FinalVerdict({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.blackOverlay80, AppColors.lightBlue50],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(AppImages.iconTrue, height: 20, width: 20),
              SizedBox(width: width * 0.02),
              Text('FINAL VERDICT', style: AppStyles.semiBold16MediumGrey2),
            ],
          ),
          SizedBox(height: height * 0.02),
          Text('URL APPEARS SAFE', style: AppStyles.bold20CayanBlue),
          SizedBox(height: height * 0.02),
          Text(
            'No active phishing signatures detected in global databases.',
            style: AppStyles.regular12MediumGrey3,
          ),
        ],
      ),
    );
  }
}
