import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class FinalVerdict extends StatelessWidget {
  final String prediction;
  final String risklevel;

  const FinalVerdict({
    super.key,
    required this.prediction,
    required this.risklevel,
  });

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
              Text(
                AppLocalizations.of(context)!.finalVerdict,
                style: AppStyles.semiBold16MediumGrey2,
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          Text(
            prediction != "phishing"
                ? AppLocalizations.of(context)!.urlAppearsSafe
                : AppLocalizations.of(context)!.urlAppearsUnsafe,
            style: AppStyles.bold20CayanBlue,
          ),
          SizedBox(height: height * 0.02),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: prediction != "phishing"
                        ? AppColors.purple15
                        : AppColors.darkRed,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.security_sharp,
                        color: AppColors.lightGrey2,
                        size: 22,
                      ),
                      Text(
                        "${AppLocalizations.of(context)!.prediction} : $prediction",
                        style: AppStyles.semiBold12LightGrey2,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: width * 0.01),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: prediction != "phishing"
                        ? AppColors.purple15
                        : AppColors.darkRed,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.fireplace_outlined,
                        color: AppColors.lightGrey2,
                        size: 22,
                      ),
                      Text(
                        "${AppLocalizations.of(context)!.riskLevel} : $risklevel",
                        style: AppStyles.semiBold12LightGrey2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}