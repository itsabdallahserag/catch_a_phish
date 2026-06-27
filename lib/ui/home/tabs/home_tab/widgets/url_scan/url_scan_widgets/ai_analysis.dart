import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AiAnalysis extends StatelessWidget {
  final List<String> explanationList;

  const AiAnalysis({
    super.key,
    required this.explanationList,
  });

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
                AppLocalizations.of(context)!.aiTacticalInsight,
                style: AppStyles.semiBold20White,
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: explanationList.map((e) {
              return Text(
                "• $e",
                style: AppStyles.light12White,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}