import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Firbase_utils/firebase_utils.dart';
import 'package:catch_a_phish/Firbase_utils/models/user_model.dart';
import 'package:catch_a_phish/Ui/home/tabs/settings_tab/widgets/settings_preferences_card.dart';
import 'package:catch_a_phish/Ui/home/tabs/settings_tab/widgets/settings_resources_card.dart';
import 'package:catch_a_phish/Ui/home/tabs/settings_tab/widgets/settings_secutity_card.dart';
import 'package:catch_a_phish/providers/app_locale_provider.dart';
import 'package:catch_a_phish/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  UserModel? user;
  late AppThemeProvider appThemeProvider;
  late AppLocaleProvider appLocaleProvider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      appThemeProvider = Provider.of<AppThemeProvider>(context, listen: false);
      appLocaleProvider = Provider.of<AppLocaleProvider>(
        context,
        listen: false,
      );
      getUser();
    });
  }

  Future<void> getUser() async {
    user = await FirebaseUtils.readUser();
    if (!mounted) return;
    appThemeProvider.changeTheme(
      user?.darkMode == true ? ThemeMode.dark : ThemeMode.light,
    );
    appLocaleProvider.changeLanguage(user?.language == 'en' ? 'en' : 'ar');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.08,
        backgroundColor: AppColors.glassGrey,
        elevation: 0,
        title: Row(
          children: [
            Text('Settings', style: AppStyles.light24White),
            Spacer(),
            Icon(Icons.search, color: AppColors.mediumGrey, size: 24),
          ],
        ),
      ),
      backgroundColor: AppColors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SettingsSecutityCard(
                realTimeProtection: user?.realTimeProtection,
                deepInspection: user?.deepInspection,
                smsFiltering: user?.smsFiltering,
                onRealTimeChanged: (value) async {
                  await FirebaseUtils.updateSetting(
                    updated: 'realTimeProtection',
                    value: value,
                  );
                  setState(() {
                    user = user?.copyWith(realTimeProtection: value);
                  });
                },
                onDeepChanged: (value) async {
                  await FirebaseUtils.updateSetting(
                    updated: 'deepInspection',
                    value: value,
                  );
                  setState(() {
                    user = user?.copyWith(deepInspection: value);
                  });
                },
                onSmsChanged: (value) async {
                  await FirebaseUtils.updateSetting(
                    updated: 'smsFiltering',
                    value: value,
                  );
                  setState(() {
                    user = user?.copyWith(smsFiltering: value);
                  });
                },
              ),
              SizedBox(height: height * 0.03),
              SettingsPreferencesCard(
                notifications: user?.notifications,
                darkMode: user?.darkMode,
                onPressedLanguage: showLanguageDialog,
                onNotificationsChanged: (value) async {
                  await FirebaseUtils.updateSetting(
                    updated: 'notifications',
                    value: value,
                  );

                  setState(() {
                    user = user?.copyWith(notifications: value);
                  });
                },

                onDarkModeChanged: (value) async {
                  await FirebaseUtils.updateSetting(
                    updated: 'darkMode',
                    value: value,
                  );
                  appThemeProvider.changeTheme(
                    value ? ThemeMode.dark : ThemeMode.light,
                  );
                  setState(() {
                    user = user?.copyWith(darkMode: value);
                  });
                },
              ),
              SizedBox(height: height * 0.03),
              SettingsResourcesCard(),
            ],
          ),
        ),
      ),
    );
  }

  void showLanguageDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('English'),
              onTap: () {
                appLocaleProvider.changeLanguage('en');
                FirebaseUtils.updateStringSetting(
                  updated: 'language',
                  value: 'en',
                );
                setState(() => user = user?.copyWith(language: 'en'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('العربية'),
              onTap: () {
                appLocaleProvider.changeLanguage('ar');
                FirebaseUtils.updateStringSetting(
                 updated: 'language',
                  value: 'ar',
                );
                setState(() => user = user?.copyWith(language: 'ar'));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
