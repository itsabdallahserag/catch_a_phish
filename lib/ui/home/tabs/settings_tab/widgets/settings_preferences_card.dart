import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Ui/home/tabs/settings_tab/widgets/settings_item.dart';
import 'package:flutter/material.dart';

class SettingsPreferencesCard extends StatelessWidget{
  const SettingsPreferencesCard({super.key});

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
              Text('Preferences', style: AppStyles.semiBold10LightGrey2),
              SizedBox(height: height * 0.02),
              SettingsItem(
                titleItem: 'Notifications',
                description: 'Immediate threat alerts',
                isActive: false,
                onChanged: (value) {},
              ),
              SizedBox(height: height * 0.02),
              SettingsItem(
                titleItem: 'Dark Mode',
                description: 'OLED optimized interface',
                isActive: true,
                onChanged: (value) {},
              ),
              SizedBox(height: height * 0.02),
              SettingsItem(
                isLanguage: true,
                titleItem: 'Language',
                description: 'English (US)',
                isActive: false,
                onChanged: (value) {},
              ),
            ],
          ),
        );
  }
}