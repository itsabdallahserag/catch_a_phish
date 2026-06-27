import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Ui/home/tabs/settings_tab/widgets/settings_item.dart';
import 'package:catch_a_phish/providers/app_locale_provider.dart';
import 'package:catch_a_phish/providers/app_theme_provider.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPreferencesCard extends StatelessWidget {
  final bool? notifications;
  final bool? darkMode;
  final Function(bool)? onNotificationsChanged;
  final Function(bool)? onDarkModeChanged;
  final void Function()? onPressedLanguage;

  const SettingsPreferencesCard({
    super.key,
    required this.notifications,
    required this.darkMode,
    required this.onNotificationsChanged,
    required this.onDarkModeChanged,
    required this.onPressedLanguage,
  });

  @override
  Widget build(BuildContext context) {
    AppThemeProvider appThemeProvider = Provider.of<AppThemeProvider>(context);
    AppLocaleProvider appLocaleProvider = Provider.of<AppLocaleProvider>(
      context,
    );

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
            AppLocalizations.of(context)!.preferences,
            style: AppStyles.semiBold10LightGrey2,
          ),

          SizedBox(height: height * 0.02),

          SettingsItem(
            titleItem: AppLocalizations.of(context)!.notifications,
            description: AppLocalizations.of(context)!.immediateThreatAlerts,
            isActive: notifications ?? true,
            onChanged: onNotificationsChanged ?? (_) {},
          ),

          SizedBox(height: height * 0.02),

          SettingsItem(
            titleItem: appThemeProvider.appTheme == ThemeMode.dark
                ? AppLocalizations.of(context)!.darkMode
                : AppLocalizations.of(context)!.lightMode,
            description: AppLocalizations.of(context)!.oledOptimizedInterface,
            isActive: darkMode ?? true,
            onChanged: onDarkModeChanged ?? (_) {},
          ),

          SizedBox(height: height * 0.02),

          SettingsItem(
            onChanged: (value) {},
            isLanguage: true,
            titleItem: AppLocalizations.of(context)!.language,
            description: appLocaleProvider.appLanguage == 'en'
                ? AppLocalizations.of(context)!.englishUs
                : AppLocalizations.of(context)!.arabic,
            isActive: false,
            onPressedLanguage: onPressedLanguage ?? () {},
          ),
        ],
      ),
    );
  }
}
