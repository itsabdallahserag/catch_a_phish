import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class UrlScan extends StatelessWidget {
  const UrlScan({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(
          bottom: 16,left: 24,top: 16
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            AppColors.blackOverlay80,
            AppColors.deepBlue,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.darkGrey,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Image.asset(AppImages.iconUrl)),
                  Spacer()
              ],
            ),
            Text('URL Scan',style: AppStyles.semiBold20White,),
            Text('Check links before you click. Cross-references 50+ threat databases.',style: AppStyles.semiLight12LightGrey,),
          ],
        ),
      ),
    );
  }
}
