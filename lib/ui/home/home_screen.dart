import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Ui/home/tabs/history_tab/history_tab.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/home_tab.dart';
import 'package:catch_a_phish/Ui/home/tabs/profile_tab/profile_tab.dart';
import 'package:catch_a_phish/Ui/home/tabs/settings_tab/settings_tab.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> tabs = const [
    HomeTab(),
    HistoryTab(),
    ProfileTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final t = AppLocalizations.of(context)!;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.primaryBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.transparent,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.blackOverlay65,
            selectedLabelStyle: AppStyles.medium10midnightBlue,
            unselectedLabelStyle: AppStyles.medium10mediumGrey,
            currentIndex: selectedIndex,
            onTap: (index) => setState(() => selectedIndex = index),
            items: [
              buildBottomNavigationBarItem(0, AppImages.iconHome, t.home),
              buildBottomNavigationBarItem(1, AppImages.iconHistory, t.history),
              buildBottomNavigationBarItem(2, AppImages.iconProfile, t.profile),
              buildBottomNavigationBarItem(
                3,
                AppImages.iconSettings,
                t.settings,
              ),
            ],
          ),
        ),
        body: tabs[selectedIndex],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
    int index,
    String iconName,
    String label,
  ) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        iconName,
        color: selectedIndex != index
            ? AppColors.mediumGrey
            : AppColors.midnightBlue,
      ),
      label: label,
    );
  }
}
