import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Ui/home/tabs/settings_tab/widgets/settings_item.dart';
import 'package:flutter/material.dart';

class SettingsSecutityCard extends StatelessWidget{
  const SettingsSecutityCard({super.key});

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
              Text('Security', style: AppStyles.semiBold10LightGrey2),
              SizedBox(height: height * 0.02),
              SettingsItem(
                titleItem: 'Real Time Protection',
                description: 'Scanning all incoming links',
                isActive: false,
                onChanged: (value) {},
              ),
              SizedBox(height: height * 0.02),
              SettingsItem(
                titleItem: 'Deep Inspection',
                description: 'Extended sandbox analysis',
                isActive: true,
                onChanged: (value) {},
              ),
              SizedBox(height: height * 0.02),
              SettingsItem(
                titleItem: 'SMS Filtering',
                description: 'Block malicious text messages',
                isActive: false,
                onChanged: (value) {},
              ),
            ],
          ),
        );
  }
}