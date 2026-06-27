import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Ui/home/tabs/settings_tab/widgets/settings_item.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
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

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.blackOverlay50,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.security,
            style: AppStyles.semiBold10LightGrey2,
          ),

          SizedBox(height: height * 0.02),

          SettingsItem(
            titleItem: AppLocalizations.of(context)!.realTimeProtection,
            description: AppLocalizations.of(context)!.scanningIncomingLinks,
            isActive: realTimeProtection ?? true,
            onChanged: onRealTimeChanged ?? (_) {},
          ),

          SizedBox(height: height * 0.02),

          SettingsItem(
            titleItem: AppLocalizations.of(context)!.deepInspection,
            description: AppLocalizations.of(context)!.extendedSandboxAnalysis,
            isActive: deepInspection ?? true,
            onChanged: onDeepChanged ?? (_) {},
          ),

          SizedBox(height: height * 0.02),

          SettingsItem(
            titleItem: AppLocalizations.of(context)!.smsFiltering,
            description: AppLocalizations.of(context)!.blockMaliciousMessages,
            isActive: smsFiltering ?? true,
            onChanged: onSmsChanged ?? (_) {},
          ),
        ],
      ),
    );
  }
}
