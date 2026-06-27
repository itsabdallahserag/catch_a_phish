import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_dialog_utils.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_routes.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Firbase_utils/firebase_utils.dart';
import 'package:catch_a_phish/Firbase_utils/models/user_model.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthSocialWidget extends StatefulWidget {
  const AuthSocialWidget({super.key});

  @override
  State<AuthSocialWidget> createState() => _AuthSocialWidgetState();
}

class _AuthSocialWidgetState extends State<AuthSocialWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () async {
              await loginWithGoogle();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.grey, width: 1),
              ),
              child: Image.asset(AppImages.google, width: 24, height: 24),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: GestureDetector(
            onTap: () async {
              await loginWithGitHub();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.grey, width: 1),
              ),
              child: Image.asset(AppImages.gitHub, width: 24, height: 24),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> loginWithGitHub() async {
    AppDialogUtils.showLoading(
      context: context,
      colorCircle: AppColors.skyBlue,
      style: AppStyles.semiBold12SkyBlue,
      backgroundColor: AppColors.navyBackground,
      dismissible: false,
    );

    try {
      final userCredential = await FirebaseUtils.loginByGitHub();

      await FirebaseUtils.addUserToFireStore(
        UserModel(
          uid: userCredential.user!.uid,
          name:
              userCredential.additionalUserInfo?.username ??
              userCredential.user?.displayName ??
              "No Name",
          email: userCredential.user!.email,
        ),
      );

      if (!mounted) return;

      AppDialogUtils.hideLoading(context);

      AppDialogUtils.showMessage(
        context: context,
        title: AppLocalizations.of(context)!.success,
        message: 'Welcome ${userCredential.user?.email}',
        dialogBackgroundColor: AppColors.navyBackground,
        dismissible: false,
        titleStyle: AppStyles.semiBold16White,
        messageStyle: AppStyles.semiBold12SkyBlue,
        posActionName: AppLocalizations.of(context)!.ok,
        posActionCallBack: () {
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        },
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      AppDialogUtils.hideLoading(context);

      AppDialogUtils.showMessage(
        context: context,
        title: AppLocalizations.of(context)!.login,
        message: e.message ?? AppLocalizations.of(context)!.unknownError,
        dialogBackgroundColor: AppColors.navyBackground,
        dismissible: false,
        titleStyle: AppStyles.semiBold16White,
        messageStyle: AppStyles.semiBold12SkyBlue,
        posActionName: AppLocalizations.of(context)!.ok,
      );
    }
  }

  Future<void> loginWithGoogle() async {
    AppDialogUtils.showLoading(
      context: context,
      colorCircle: AppColors.skyBlue,
      style: AppStyles.semiBold12SkyBlue,
      backgroundColor: AppColors.navyBackground,
      dismissible: false,
    );

    try {
      final userCredential = await FirebaseUtils.loginByGoogle();

      if (userCredential == null) {
        if (!mounted) return;

        AppDialogUtils.hideLoading(context);

        AppDialogUtils.showMessage(
          context: context,
          title:  AppLocalizations.of(context)!.cancelled,
          message:  AppLocalizations.of(context)!.googleSignInCancelled,
          dialogBackgroundColor: AppColors.navyBackground,
          dismissible: false,
          titleStyle: AppStyles.semiBold16White,
          messageStyle: AppStyles.semiBold12SkyBlue,
          posActionName:  AppLocalizations.of(context)!.ok,
        );
        return;
      }

      await FirebaseUtils.addUserToFireStore(
        UserModel(
          uid: userCredential.user!.uid,
          name: userCredential.user?.displayName ?? "No Name",
          email: userCredential.user!.email,
        ),
      );

      if (!mounted) return;

      AppDialogUtils.hideLoading(context);

      AppDialogUtils.showMessage(
        context: context,
        title:  AppLocalizations.of(context)!.ok,
        message: '${ AppLocalizations.of(context)!.welcomeUser} ${userCredential.user?.email}',
        dialogBackgroundColor: AppColors.navyBackground,
        dismissible: false,
        titleStyle: AppStyles.semiBold16White,
        messageStyle: AppStyles.semiBold12SkyBlue,
        posActionName:  AppLocalizations.of(context)!.ok,
        posActionCallBack: () {
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        },
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      AppDialogUtils.hideLoading(context);

      AppDialogUtils.showMessage(
        context: context,
        title:  AppLocalizations.of(context)!.loginFailed,
        message: e.message ??  AppLocalizations.of(context)!.unknownError,
        dialogBackgroundColor: AppColors.navyBackground,
        dismissible: false,
        titleStyle: AppStyles.semiBold16White,
        messageStyle: AppStyles.semiBold12SkyBlue,
        posActionName:  AppLocalizations.of(context)!.ok,
      );
    }
  }
}
