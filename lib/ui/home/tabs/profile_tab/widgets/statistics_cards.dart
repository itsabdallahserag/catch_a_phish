import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class StatisticsCards extends StatelessWidget {
  final int totalScans ;
  final int threatsBlocked ;
  const StatisticsCards({super.key,required this.totalScans,required this.threatsBlocked});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(32),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.blackOverlay80,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Total Scans', style: AppStyles.regular12MediumGrey3),
                Text('$totalScans', style: AppStyles.light30White),
                ],
              
            ),
          ),
        ),
        SizedBox(width: width*0.02,),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(32),

            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.blackOverlay80,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Threats Blocked', style: AppStyles.regular12MediumGrey3),
                Text('$threatsBlocked', style: AppStyles.light30White),
                ],
              
            ),
          ),
        ),
      ],
    );
  }
}
