import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class UrlContentButton extends StatelessWidget {
  const UrlContentButton({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.iconEngaged,
          color: AppColors.black,
          height: 20,
          width: 20,
        ),
        SizedBox(width: width * 0.02),
        Text('Scan URL', style: AppStyles.medium16Black),
      ],
    );
  }
}
