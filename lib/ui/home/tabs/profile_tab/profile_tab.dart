import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_dialog_utils.dart';
import 'package:catch_a_phish/Core/utils/app_routes.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Firbase_utils/firebase_utils.dart';
import 'package:catch_a_phish/Firbase_utils/models/user_model.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/auth_action_button.dart';
import 'package:catch_a_phish/Ui/home/tabs/profile_tab/widgets/authentication_screen.dart';
import 'package:catch_a_phish/Ui/home/tabs/profile_tab/widgets/profile_image.dart';
import 'package:catch_a_phish/Ui/home/tabs/profile_tab/widgets/security_item.dart';
import 'package:catch_a_phish/Ui/home/tabs/profile_tab/widgets/statistics_cards.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  UserModel? user;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    try {
      user = await FirebaseUtils.readUser();
    } catch (e) {
      user = null;
    }

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (user == null) {
      return Center(child: Text(AppLocalizations.of(context)!.noUserFound));
    }
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
            Text(user!.name ?? '', style: AppStyles.light24White),
            SizedBox(height: height * 0.01),
            Text(user!.email!, style: AppStyles.semiBold16MediumGrey2),
            SizedBox(height: height * 0.02),
            StatisticsCards(
              threatsBlocked: user!.threatsBlocked,
              totalScans: user!.totalScans,
            ),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.accountSecurity,
                  style: AppStyles.medium10mediumGrey,
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: height * 0.01),
            SecurityItem(
              icon: Icons.security_rounded,
              titleText: AppLocalizations.of(context)!.enhancedProtection,
              bodyText: AppLocalizations.of(context)!.activePremium,
            ),
            SizedBox(height: height * 0.02),
            SecurityItem(
              icon: Icons.lock,
              titleText: AppLocalizations.of(context)!.authentication,
              bodyText: AppLocalizations.of(context)!.twoFactorEnabled,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AuthenticationScreen()),
              ),
            ),
            SizedBox(height: height * 0.02),
            SecurityItem(
              icon: Icons.notifications,
              titleText: AppLocalizations.of(context)!.alertPreferences,
              bodyText: AppLocalizations.of(context)!.immediateNotifications,
            ),
            SizedBox(height: height * 0.02),
            AuthActionButton(
              onTap: () {
                AppDialogUtils.showMessage(
                  context: context,
                  message: AppLocalizations.of(context)!.signOutConfirmation,
                  title: AppLocalizations.of(context)!.signOut,
                  negActionName: AppLocalizations.of(context)!.cancel,

                  negActionCallBack: () {
                    Navigator.pop(context);
                  },
                  posActionName: AppLocalizations.of(context)!.signOut,
                  posActionCallBack: () async {
                    Navigator.of(context).pop();

                    final navigator = Navigator.of(context);

                    await FirebaseUtils.signOut();

                    if (!mounted) return;

                    navigator.pushNamedAndRemoveUntil(
                      AppRoutes.login,
                      (route) => false,
                    );
                  },
                );
              },
              borderColor: AppColors.red,
              gradientColors: [
                AppColors.blackOverlay80,
                AppColors.blackOverlay80,
              ],
              child: Text(
                AppLocalizations.of(context)!.signOut,
                style: AppStyles.medium14Red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
