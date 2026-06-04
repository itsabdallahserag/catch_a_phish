import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_dialog_utils.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_routes.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Firbase_utils/firebase_utils.dart';
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
                border: Border.all(
                  color: AppColors.grey,
                  width: 1,
                ),
              ),
              child: Image.asset(
                AppImages.google,
                width: 24,
                height: 24,
              ),
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
                border: Border.all(
                  color: AppColors.grey,
                  width: 1,
                ),
              ),
              child: Image.asset(
                AppImages.gitHub,
                width: 24,
                height: 24,
              ),
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
      UserCredential userCredential =
          await FirebaseUtils.loginByGitHub();

      if (!mounted) return;

      AppDialogUtils.hideLoading(context);

      AppDialogUtils.showMessage(
        context: context,
        title: 'Success',
        message: 'Welcome ${userCredential.user?.email}',
        dialogBackgroundColor: AppColors.navyBackground,
        dismissible: false,
        titleStyle: AppStyles.semiBold16White,
        messageStyle: AppStyles.semiBold12SkyBlue,
        posActionStyle: AppStyles.semiBold16White,
        posActionName: 'OK',
        posActionCallBack: () {
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.home,
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      AppDialogUtils.hideLoading(context);

      AppDialogUtils.showMessage(
        context: context,
        title: 'Login Failed',
        message: e.message ?? 'Unknown Error',
        dialogBackgroundColor: AppColors.navyBackground,
        dismissible: false,
        titleStyle: AppStyles.semiBold16White,
        messageStyle: AppStyles.semiBold12SkyBlue,
        posActionStyle: AppStyles.semiBold16White,
        posActionName: 'OK',
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
      UserCredential? userCredential =
          await FirebaseUtils.loginByGoogle();

      if (!mounted) return;

      AppDialogUtils.hideLoading(context);

      //login failed or cancelled by user
      if (userCredential == null) {
        AppDialogUtils.showMessage(
          context: context,
          title: 'Cancelled',
          message: 'Google sign in was cancelled',
          dialogBackgroundColor: AppColors.navyBackground,
          dismissible: false,
          titleStyle: AppStyles.semiBold16White,
          messageStyle: AppStyles.semiBold12SkyBlue,
          posActionStyle: AppStyles.semiBold16White,
          posActionName: 'OK',
        );
        return;
      }

      //login succses
      AppDialogUtils.showMessage(
        context: context,
        title: 'Success',
        message: 'Welcome ${userCredential.user?.email}',
        dialogBackgroundColor: AppColors.navyBackground,
        dismissible: false,
        titleStyle: AppStyles.semiBold16White,
        messageStyle: AppStyles.semiBold12SkyBlue,
        posActionStyle: AppStyles.semiBold16White,
        posActionName: 'OK',
        posActionCallBack: () {
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.home,
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      AppDialogUtils.hideLoading(context);

      AppDialogUtils.showMessage(
        context: context,
        title: 'Login Failed',
        message: e.message ?? 'Unknown Error',
        dialogBackgroundColor: AppColors.navyBackground,
        dismissible: false,
        titleStyle: AppStyles.semiBold16White,
        messageStyle: AppStyles.semiBold12SkyBlue,
        posActionStyle: AppStyles.semiBold16White,
        posActionName: 'OK',
      );
    }
  }
}