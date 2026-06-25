import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_dialog_utils.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_routes.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Firbase_utils/firebase_utils.dart';
import 'package:catch_a_phish/Firbase_utils/models/user_model.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/auth_action_button.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/auth_social_widget.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/custom_text_field.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.enterYourName, style: AppStyles.regular12White),
            SizedBox(height: 8),
            CustomTextField(
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return AppLocalizations.of(context)!.nameRequired;
                }
                return null;
              },
              controller: nameController,
              hintText: AppLocalizations.of(context)!.name,
              keyboardType: TextInputType.name,
              prefixIcon: Icon(
                Icons.person,
                color: AppColors.primary,
                size: 18,
              ),
            ),
            SizedBox(height: 16),
            Text(AppLocalizations.of(context)!.enterYourEmail, style: AppStyles.regular12White),
            SizedBox(height: 8),
            CustomTextField(
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return AppLocalizations.of(context)!.emailRequired;
                }
                final emailRegex = RegExp(r'^[\w.-]+@[\w.-]+\.\w{2,}$');
                if (!emailRegex.hasMatch(text)) {
                  return AppLocalizations.of(context)!.enterValidEmail;
                }
                return null;
              },
              controller: emailController,
              hintText: 'email@example.com',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Image.asset(
                AppImages.iconEmail,
                color: AppColors.primary,
                height: 20,
                width: 20,
              ),
            ),
            SizedBox(height: 16),
            Text(AppLocalizations.of(context)!.enterYourPassword, style: AppStyles.regular12White),
            SizedBox(height: 8),
            CustomTextField(
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return AppLocalizations.of(context)!.passwordRequired;
                }
                if (text.length < 8) {
                  return AppLocalizations.of(context)!.passwordMinLength;
                }
                if (!text.contains(RegExp(r'[A-Z]'))) {
                  return AppLocalizations.of(context)!.passwordUppercase;
                }
                if (!text.contains(RegExp(r'[0-9]'))) {
                  return AppLocalizations.of(context)!.passwordNumber;
                }
                return null;
              },

              controller: passwordController,
              hintText: AppLocalizations.of(context)!.password,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Image.asset(
                AppImages.iconPassword,
                color: AppColors.primary,
                height: 20,
                width: 20,
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            Text(AppLocalizations.of(context)!.confirmYourPassword, style: AppStyles.regular12White),
            SizedBox(height: 8),
            CustomTextField(
              validator: (text) {
                if (text != passwordController.text) {
                  return AppLocalizations.of(context)!.passwordsDoNotMatch;
                }
                return null;
              },
              controller: confirmPasswordController,
              hintText: AppLocalizations.of(context)!.confirmPassword,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Image.asset(
                AppImages.iconPassword,
                color: AppColors.primary,
                height: 20,
                width: 20,
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            AuthActionButton(
              gradientColors: [AppColors.neonBlue, AppColors.primary],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AppLocalizations.of(context)!.accessSecureTerminal,
                    style: AppStyles.medium16Black,
                  ),
                  Icon(Icons.arrow_forward, color: AppColors.black),
                ],
              ),
              onTap: () {
                signUp();
              },
            ),
            SizedBox(height: 36),
            Text(
              AppLocalizations.of(context)!.orContinueWith,
              style: AppStyles.bold15Grey,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 36),
            AuthSocialWidget(),
          ],
        ),
      ),
    );
  }

  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      AppDialogUtils.showLoading(
        backgroundColor: AppColors.navyBackground,
        dismissible: false,
        context: context,
        colorCircle: AppColors.skyBlue,
        style: AppStyles.semiBold12SkyBlue,
      );

      try {
        UserCredential userCredential =
            await FirebaseUtils.signUpWithEmailAndPassword(
              emailController.text.trim(),
              passwordController.text.trim(),
            );
        await userCredential.user!.updateDisplayName(
          nameController.text.trim(),
        );
        await FirebaseUtils.addUserToFireStore(
          UserModel(
            uid: userCredential.user!.uid,
            name: nameController.text.trim(),
            email: userCredential.user!.email,
          ),
        );
        await FirebaseUtils.sendEmailVerification();
        await FirebaseUtils.signOut();

        if (!mounted) return;

        AppDialogUtils.hideLoading(context);

        AppDialogUtils.showMessage(
          context: context,
          title: AppLocalizations.of(context)!.verifyYourEmail,
          message:
              AppLocalizations.of(context)!.verificationEmailSent,
          posActionName:AppLocalizations.of(context)!.ok,
          posActionCallBack: () {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          },
        );
      } on FirebaseAuthException catch (e) {
        if (!mounted) return;

        AppDialogUtils.hideLoading(context);

        AppDialogUtils.showMessage(
          context: context,
          title: AppLocalizations.of(context)!.signUpFailed,
          message: e.message ?? AppLocalizations.of(context)!.unknownError,
          dialogBackgroundColor: AppColors.navyBackground,
          dismissible: false,
          messageStyle: AppStyles.semiBold12SkyBlue,
          titleStyle: AppStyles.semiBold16White,
          posActionStyle: AppStyles.semiBold16White,
          posActionName:AppLocalizations.of(context)!.ok,
        );
      }
    }
  }
}
