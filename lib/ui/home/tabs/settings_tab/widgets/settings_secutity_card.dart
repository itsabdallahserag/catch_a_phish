import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Ui/home/tabs/settings_tab/widgets/settings_item.dart';
import 'package:flutter/material.dart';

class SettingsSecutityCard extends StatelessWidget {
  final bool? realTimeProtection;
  final bool? deepInspection;
  final bool? smsFiltering;
  final Function(bool)? onRealTimeChanged;
  final Function(bool)? onDeepChanged;
  final Function(bool)? onSmsChanged;
  const SettingsSecutityCard({
    super.key,
    required this.deepInspection,
    required this.onDeepChanged,
    required this.onRealTimeChanged,
    required this.onSmsChanged,
    required this.realTimeProtection,
    required this.smsFiltering,
  });

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
            isActive: realTimeProtection ?? true,
            onChanged: onRealTimeChanged ?? (_){},
          ),
          SizedBox(height: height * 0.02),
          SettingsItem(
            titleItem: 'Deep Inspection',
            description: 'Extended sandbox analysis',
            isActive: deepInspection ?? true,
            onChanged: onDeepChanged ?? (_){},
          ),
          SizedBox(height: height * 0.02),
          SettingsItem(
            titleItem: 'SMS Filtering',
            description: 'Block malicious text messages',
            isActive: smsFiltering ?? true,
            onChanged: onSmsChanged ?? (_){},
          ),
        ],
      ),
    );
  }
}
