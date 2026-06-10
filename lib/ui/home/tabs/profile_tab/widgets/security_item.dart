import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SecurityItem extends StatelessWidget {
  final IconData icon;
  final String titleText;
  final String bodyText;
  const SecurityItem({
    super.key,
    required this.icon,
    required this.titleText,
    required this.bodyText,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.blackOverlay40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.glassGrey,
            ),
            child: Icon(icon,color: AppColors.white,size: 18,),
          ),
          SizedBox(width: width*0.04,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titleText, style: AppStyles.regular16White),
              Text(bodyText, style: AppStyles.regular12LightGrey),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.mediumGrey,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
