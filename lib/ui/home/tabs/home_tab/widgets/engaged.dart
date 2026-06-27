import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Engaged extends StatelessWidget {
  const Engaged({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(bottom: 16, left: 24, top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [AppColors.neonGreenOverlay69, AppColors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppImages.iconEngaged),
          SizedBox(height: height * 0.02),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.systemShield,
                style: AppStyles.semiBold24White,
              ),
          SizedBox(width: width * 0.04),

              Text(
                AppLocalizations.of(context)!.engaged,
                style: AppStyles.semiBold24GreenNeon,
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          Text(
            AppLocalizations.of(context)!.realTimeMonitoring,
            style: AppStyles.regular12LightGrey,
          ),
        ],
      ),
    );
  }
}
