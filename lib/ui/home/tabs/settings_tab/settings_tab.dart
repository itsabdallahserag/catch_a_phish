import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Ui/home/tabs/settings_tab/widgets/settings_preferences_card.dart';
import 'package:catch_a_phish/Ui/home/tabs/settings_tab/widgets/settings_resources_card.dart';
import 'package:catch_a_phish/Ui/home/tabs/settings_tab/widgets/settings_secutity_card.dart';
import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

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
              SettingsSecutityCard(),
              SizedBox(height: height*0.03,),
              SettingsPreferencesCard(),
              SizedBox(height: height*0.03,),
              SettingsResourcesCard()
            ],
          ),
        ),
      ),
    );
  }
}
