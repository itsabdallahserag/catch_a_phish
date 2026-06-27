import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan/webview/web_view_screen.dart';
import 'package:catch_a_phish/Ui/home/tabs/settings_tab/widgets/settings_item.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SettingsResourcesCard extends StatelessWidget {
  const SettingsResourcesCard({super.key});

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
            AppLocalizations.of(context)!.resources,
            style: AppStyles.semiBold10LightGrey2,
          ),

          SizedBox(height: height * 0.02),

          SettingsItem(
            onChanged: (value) {},
            isLanguage: true,
            titleItem: AppLocalizations.of(context)!.helpCenter,
            description: '',
            isActive: true,
            onPressedLanguage: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => WebViewScreen(
                  url: 'https://catch-a-phish.web.app/help.html',
                ),
              ),
            ),
          ),

          SizedBox(height: height * 0.02),

          SettingsItem(
            onChanged: (value) {},
            isLanguage: true,
            titleItem: AppLocalizations.of(context)!.privacyPolicy,
            description: '',
            isActive: true,
            onPressedLanguage: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => WebViewScreen(
                  url: 'https://catch-a-phish.web.app/privacy.html',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
