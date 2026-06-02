import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class Engaged extends StatelessWidget {
  const Engaged({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 16,left: 24,top: 16
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(colors: [
          AppColors.neonGreenOverlay69,
          AppColors.black
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppImages.iconEngaged),
          Row(
            children: [
              Text('System Shield: ',style: AppStyles.semiBold24White,),
              Text('Engaged',style: AppStyles.semiBold24GreenNeon,),

            ],
          ),
          Text('Real-time heuristics monitoring active.',style: AppStyles.regular12LightGrey,)
        ],
      ),
    );
  }
}
