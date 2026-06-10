import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Ui/home/tabs/settings_tab/widgets/settings_item.dart';
import 'package:flutter/material.dart';

class SettingsResourcesCard extends StatelessWidget{
  const SettingsResourcesCard({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.blackOverlay50,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Resources', style: AppStyles.semiBold10LightGrey2),
              SizedBox(height: height * 0.02),
              SettingsItem(
                isLanguage: true,
                titleItem: 'Help Center',
                description: '',
                isActive: false,
                onChanged: (value) {},
              ),
              SizedBox(height: height * 0.02),
              SettingsItem(
                isLanguage: true,
                titleItem: 'Privacy Policy',
                description: '',
                isActive: true,
                onChanged: (value) {},
              ),
            ],
          ),
        );
  }
}