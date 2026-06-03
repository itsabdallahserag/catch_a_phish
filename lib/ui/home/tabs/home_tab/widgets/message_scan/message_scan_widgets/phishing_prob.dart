import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PhishingProb extends StatelessWidget {
  final double percent ;
  final TextStyle centerStyle ;
  final TextStyle footerStyle ;
  final String footerText ;
  final Color progressColor ;
  final double radius ;
  const PhishingProb({super.key, required this.percent, required this.centerStyle, required this.footerStyle, required this.footerText, required this.progressColor, required this.radius});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animateFromLastPercent: true,
      backgroundColor: AppColors.slateGrey,
      radius: radius,
      lineWidth: 10.0,
      animation: true,
      percent: percent,
      center: Text(
        "${(percent * 100).toStringAsFixed(1)}%",
        style: centerStyle,
      ),
      footer: Text(
        footerText,
        style: footerStyle,
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: progressColor,
    );
  }
}
