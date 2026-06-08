import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/auth_action_button.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan/url_scan_widgets/ai_analysis.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan/url_scan_widgets/confidence_and_ml.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan/url_scan_widgets/final_verdict.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan/url_scan_widgets/linear_probability.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan/url_scan_widgets/screen_image.dart';
import 'package:catch_a_phish/api/models/url/ScreenShootResponce.dart';
import 'package:catch_a_phish/api/models/url/UrlResponce.dart';
import 'package:flutter/material.dart';

class UrlScanResult extends StatelessWidget {
  final UrlResponce? urlResult;
  final ScreenShootResponce? screenResult;
  const UrlScanResult({
    super.key,
    required this.urlResult,
    required this.screenResult,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return FadeInDown(
      from: 50,
      duration: Duration(milliseconds: 700),
      child: Column(
        children: [
          SizedBox(height: height * 0.02),
          FinalVerdict(
            prediction: urlResult!.prediction!,
            risklevel: urlResult!.riskLevel!,
          ),
          SizedBox(height: height * 0.02),
          AiAnalysis(explanationList: urlResult!.explanations ??[]),
          SizedBox(height: height * 0.02),
          LinearProbability(
            iconName: AppImages.iconRisk,
            percentage: urlResult!.phishingProbability!.toDouble() / 100,
          ),
          SizedBox(height: height * 0.02),
          LinearProbability(
            iconName: AppImages.iconTrue,
            percentage: urlResult!.legitimateProbability!.toDouble() / 100,
          ),
          SizedBox(height: height * 0.02),
          ConfidenceAndMl(
            confidenceScore: urlResult!.confidenceScore!.toDouble(),
            mlProbability: urlResult!.mlProbability!.toDouble(),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Screenshot of the URL\'s landing page',
            style: AppStyles.regular12MediumGrey3,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: height * 0.02),
          ScreenImage(screenResult: screenResult),
          SizedBox(height: height * 0.02),
          AuthActionButton(
            borderColor: AppColors.red,
            gradientColors: [AppColors.darkRed50, AppColors.darkRed50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.iconReport, height: 24, width: 24),
                SizedBox(width: width * 0.02),
                Text('REPORT THIS URL', style: AppStyles.medium14Red),
              ],
            ),
            onTap: () {},
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Analysis based on real-time heuristics and crowdsourced intelligence. Always verify the sender of the link.',
            style: AppStyles.regular12MediumGrey3,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
