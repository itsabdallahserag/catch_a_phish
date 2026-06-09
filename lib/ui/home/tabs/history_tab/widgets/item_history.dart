import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ItemHistory extends StatelessWidget{
  const ItemHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.blackOverlay40
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.glassGrey
            ),
            child: Image.asset(AppImages.iconRisk,fit: BoxFit.contain,),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('secure-login-bank.com/update', style: AppStyles.regular16White),
              Text('1 hour ago • Clean Scan' ,style: AppStyles.regular12LightGrey),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.glassGrey
            ),
            child: Text('Malicious', style: AppStyles.bold12Red),
          ),
        ],
      ),
    );
  }
}