import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

class ConfidenceAndMl extends StatelessWidget {
  final num confidenceScore;
  final num mlProbability;

  const ConfidenceAndMl({
    super.key,
    required this.confidenceScore,
    required this.mlProbability,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(26),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.nightBackground,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  AppLocalizations.of(context)!.confidenceScore,
                  style: AppStyles.semiBold12LightGrey2,
                ),
                Text(
                  "${confidenceScore.toDouble().toStringAsFixed(2)}%",
                  style: AppStyles.semiBold12LightGrey2,
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: width * 0.01),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(26),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.nightBackground,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  AppLocalizations.of(context)!.mlProbability,
                  style: AppStyles.semiBold12LightGrey2,
                ),
                Text(
                  "${mlProbability.toDouble().toStringAsFixed(2)}%",
                  style: AppStyles.semiBold12LightGrey2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}