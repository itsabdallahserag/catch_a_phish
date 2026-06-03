import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AiAnalysis extends StatelessWidget {
  const AiAnalysis({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.blackOverlay80, AppColors.darkRed],
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
                          Image.asset(AppImages.iconAi, height: 26, width: 26),
                          SizedBox(width: width * 0.04),
                          Text(
                            'AI Tactical Insight',
                            style: AppStyles.semiBold20White,
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        '"This message contains high-frequency urgency triggers ("immediate", "permanent closure") and suspicious sender patterns. The embedded URL redirects to a non-standard TLD associated with credential harvesting."',
                        style: AppStyles.light12White,
                      ),
                    ],
                  ),
                );
  }
}