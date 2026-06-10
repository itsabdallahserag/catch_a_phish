import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/auth_action_button.dart';
import 'package:catch_a_phish/Ui/home/tabs/profile_tab/widgets/profile_image.dart';
import 'package:catch_a_phish/Ui/home/tabs/profile_tab/widgets/security_item.dart';
import 'package:catch_a_phish/Ui/home/tabs/profile_tab/widgets/statistics_cards.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.1,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileImage(),
            SizedBox(height: height * 0.02),
            Text('Serag', style: AppStyles.light24White),
            SizedBox(height: height * 0.01),
            Text('Serag862@gmail.com', style: AppStyles.semiBold16MediumGrey2),
            SizedBox(height: height * 0.02),
            StatisticsCards(),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Text('Account Security', style: AppStyles.medium10mediumGrey),
                Spacer()
              ],
            ),
            SizedBox(height: height * 0.01),
            SecurityItem(
              icon: Icons.security_rounded,
              titleText: 'Enhanced Protection',
              bodyText: 'Active • Premium',
            ),
            SizedBox(height: height * 0.02),
            SecurityItem(
              icon: Icons.lock,
              titleText: 'Authentication',
              bodyText: 'Two-factor enabled',
            ),
            SizedBox(height: height * 0.02),
            SecurityItem(
              icon: Icons.notifications,
              titleText: 'Alert Preferences',
              bodyText: 'Immediate notifications',
            ),
            SizedBox(height: height * 0.02),
            AuthActionButton(
              onTap: () {
                
              },
              borderColor: AppColors.red,
              gradientColors:[AppColors.blackOverlay80,AppColors.blackOverlay80,] ,
              child: Text('Sign Out',style:AppStyles.medium14Red,) ,
                )
          ],
        ),
      ),
    );
  }
}
