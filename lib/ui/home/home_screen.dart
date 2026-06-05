import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Ui/home/tabs/history_tab/history_tab.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/home_tab.dart';
import 'package:catch_a_phish/Ui/home/tabs/profile_tab/profile_tab.dart';
import 'package:catch_a_phish/Ui/home/tabs/settings_tab/settings_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [HomeTab(), HistoryTab(), ProfileTab(), SettingsTab()];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
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
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              buildBottomNavigationBarItem(0, AppImages.iconHome, 'Home'),
              buildBottomNavigationBarItem(1, AppImages.iconHistory, 'History'),
              buildBottomNavigationBarItem(2, AppImages.iconProfile, 'Profile'),
              buildBottomNavigationBarItem(
                3,

                AppImages.iconSettings,
                'Settings',
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

/* appBar: AppBar(
          toolbarHeight: height * 0.1,
          backgroundColor: AppColors.darkGrey,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Image.asset(AppImages.splash,fit: BoxFit.cover, height: height * 0.14)),
                SizedBox(width: width * 0.5), 
                Expanded(
                  child: CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    child: Icon(Icons.person, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ), */
