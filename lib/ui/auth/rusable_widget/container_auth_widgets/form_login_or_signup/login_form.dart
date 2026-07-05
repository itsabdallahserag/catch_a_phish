import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_dialog_utils.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_routes.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Firbase_utils/firebase_utils.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/auth_action_button.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/auth_social_widget.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/custom_text_field.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    loadRememberMe();
  }

  Future<void> loadRememberMe() async {
    final remember = await storage.read(key: "remember_me");

    if (remember == "true") {
      emailController.text = await storage.read(key: "email") ?? "";
      passwordController.text = await storage.read(key: "password") ?? "";

      setState(() {
        rememberMe = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.enterYourEmail,
              style: AppStyles.regular12White,
            ),
            const SizedBox(height: 8),
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
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.enterYourPassword,
              style: AppStyles.regular12White,
            ),
            const SizedBox(height: 8),
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
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value!;
                    });
                  },
                ),
                Text(
                  AppLocalizations.of(context)!.rememberMe,
                  style: AppStyles.regular12White,
                ),
                const Spacer(),
                Text(
                  'Forgot password?',
                  style: AppStyles.medium12Blue,
                ),
              ],
            ),
            const SizedBox(height: 16),
            AuthActionButton(
              gradientColors: [
                AppColors.neonBlue,
                AppColors.primary,
              ],
              onTap: login,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AppLocalizations.of(context)!.accessSecureTerminal,
                    style: AppStyles.medium16Black,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
            Text(
              AppLocalizations.of(context)!.orContinueWith,
              style: AppStyles.bold15Grey,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 36),
            const AuthSocialWidget(),
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    AppDialogUtils.showLoading(
      backgroundColor: AppColors.navyBackground,
      dismissible: false,
      context: context,
      colorCircle: AppColors.skyBlue,
      style: AppStyles.semiBold12SkyBlue,
    );

    try {
      UserCredential userCredential =
          await FirebaseUtils.signInWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (!mounted) return;

      if (!FirebaseUtils.isEmailVerified()) {
        await FirebaseUtils.sendEmailVerification();
        await FirebaseUtils.signOut();

        if (!mounted) return;

        AppDialogUtils.hideLoading(context);

        AppDialogUtils.showMessage(
          context: context,
          title: AppLocalizations.of(context)!.verifyYourEmail,
          message: AppLocalizations.of(context)!.verificationEmailSent,
          posActionName: AppLocalizations.of(context)!.ok,
          posActionCallBack: () => Navigator.pop(context),
        );

        return;
      }

      if (rememberMe) {
        await storage.write(
          key: "remember_me",
          value: "true",
        );

        await storage.write(
          key: "email",
          value: emailController.text.trim(),
        );

        await storage.write(
          key: "password",
          value: passwordController.text,
        );
      } else {
        await storage.delete(key: "remember_me");
        await storage.delete(key: "email");
        await storage.delete(key: "password");
      }

      AppDialogUtils.hideLoading(context);

      AppDialogUtils.showMessage(
        dialogBackgroundColor: AppColors.navyBackground,
        dismissible: false,
        messageStyle: AppStyles.semiBold12SkyBlue,
        titleStyle: AppStyles.semiBold16White,
        posActionStyle: AppStyles.semiBold16White,
        context: context,
        title: AppLocalizations.of(context)!.success,
        message:
            '${AppLocalizations.of(context)!.welcomeUser} ${userCredential.user?.email}',
        posActionName: AppLocalizations.of(context)!.ok,
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
        title: AppLocalizations.of(context)!.loginFailed,
        message: e.message ?? AppLocalizations.of(context)!.unknownError,
        dialogBackgroundColor: AppColors.navyBackground,
        dismissible: false,
        messageStyle: AppStyles.semiBold12SkyBlue,
        titleStyle: AppStyles.semiBold16White,
        posActionStyle: AppStyles.semiBold16White,
        posActionName: AppLocalizations.of(context)!.ok,
      );
    }
  }
}