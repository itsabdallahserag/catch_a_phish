import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearProbability extends StatelessWidget {
  final String iconName;
  final double percentage;
  const LinearProbability({super.key, required this.iconName, required this.percentage});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
                  height: height * 0.1,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: AppColors.blackOverlay50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(iconName,color: iconName == AppImages.iconRisk ? AppColors.red : AppColors.aquaGreen, height: 20, width: 20),
                          SizedBox(width: width * 0.02),
                          Text(iconName == AppImages.iconRisk ? 'PHISHING PROBABILITY' : 'LEGITIMATE PROBABILITY',
                           style: iconName == AppImages.iconRisk ? AppStyles.semiBold12LightGrey2 :AppStyles.semiBold12AquaGreen),
                          Spacer(),
                          Text('${(percentage * 100).toInt()}%', style: iconName == AppImages.iconRisk ? AppStyles.black12Coral : AppStyles.black12AquaGreen),
                        ],
                      ),
                      LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        lineHeight: 8,
                        percent: percentage,
                        barRadius: const Radius.circular(20),
                        backgroundColor: AppColors.darkGrey,
                        progressColor:iconName == AppImages.iconRisk ? Colors.red: AppColors.aquaGreen,
                      ),
                    ],
                  ),
                );
  }
}