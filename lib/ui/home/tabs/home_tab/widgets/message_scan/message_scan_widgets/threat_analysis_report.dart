import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/auth_action_button.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/message_scan/message_scan_widgets/phishing_prob.dart';
import 'package:flutter/material.dart';

class ThreatAnalysisReport extends StatelessWidget {
  const ThreatAnalysisReport({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.blackOverlay40,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Threat Analysis Report', style: AppStyles.semiBold18White),
              Image.asset(AppImages.iconExclamationMark, height: 24, width: 24),
            ],
          ),
          SizedBox(height: height * 0.02),
          PhishingProb(
            radius: 45.0,
            centerStyle: AppStyles.black16Coral,
            footerStyle: AppStyles.semiBold12Coral,
            footerText: 'Phishing Probability',
            percent: 0.75,
            progressColor: AppColors.coral,
          ),
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PhishingProb(
                radius: 40.0,
                centerStyle: AppStyles.black16AquaGreen,
                footerStyle: AppStyles.semiBold12AquaGreen,
                footerText: 'Ligitimate',
                percent: 0.15,
                progressColor: AppColors.aquaGreen,
              ),
              PhishingProb(
                radius: 40.0,
                centerStyle: AppStyles.black16SkyBlue,
                footerStyle: AppStyles.semiBold12SkyBlue,
                footerText: 'Spam Score',
                percent: 0.10,
                progressColor: AppColors.skyBlue,
              ),
            ],
          ),
          SizedBox(height: height * 0.03),
          AuthActionButton(
            borderColor: AppColors.red,
            gradientColors: [AppColors.darkRed50, AppColors.darkRed50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.iconRisk, height: 24, width: 24),
                SizedBox(width: width * 0.02),
                Text(
                  'HIGH PHISHING RISK',
                  style: AppStyles.medium14Red,
                ),
              ],
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
