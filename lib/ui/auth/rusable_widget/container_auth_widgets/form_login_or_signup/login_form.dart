import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_dialog_utils.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_routes.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Firbase_utils/firebase_utils.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/auth_action_button.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/auth_social_widget.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Enter your email', style: AppStyles.regular12White),
            SizedBox(height: 8),
            CustomTextField(
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Email is required';
                }
                final emailRegex = RegExp(r'^[\w.-]+@[\w.-]+\.\w{2,}$');
                if (!emailRegex.hasMatch(text)) {
                  return 'Enter a valid email';
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
            Text('Enter your password', style: AppStyles.regular12White),
            SizedBox(height: 8),
            CustomTextField(
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Password is required';
                }
                if (text.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                if (!text.contains(RegExp(r'[A-Z]'))) {
                  return 'Password must contain at least one uppercase letter';
                }
                if (!text.contains(RegExp(r'[0-9]'))) {
                  return 'Password must contain at least one number';
                }
                return null;
              },

              controller: passwordController,
              hintText: 'Password',
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
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text('Remember me', style: AppStyles.regular12White),
                Spacer(),
                Text('Forgot password?', style: AppStyles.medium12Blue),
              ],
            ),
            SizedBox(height: 16),
            AuthActionButton(
              gradientColors: [AppColors.neonBlue, AppColors.primary],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'ACCESS SECURE TERMINAL',
                    style: AppStyles.medium16Black,
                  ),
                  Icon(Icons.arrow_forward, color: AppColors.black),
                ],
              ),
              onTap: () {
                login();
              },
            ),
            SizedBox(height: 36),
            Text(
              'OR CONTINUE WITH',
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

  Future<void> login() async {
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
            title: 'Verify Your Email',
            message:
                'We sent a verification email. Please check your inbox and verify, then login again.',
            posActionName: 'OK',
            posActionCallBack: () => Navigator.pop(context),
          );
          return;
        }

        AppDialogUtils.hideLoading(context);

        AppDialogUtils.showMessage(
          dialogBackgroundColor: AppColors.navyBackground,
          dismissible: false,
          messageStyle: AppStyles.semiBold12SkyBlue,
          titleStyle: AppStyles.semiBold16White,
          posActionStyle: AppStyles.semiBold16White,
          context: context,
          title: 'Success',
          message: 'Welcome ${userCredential.user?.email}',
          posActionName: 'OK',
          posActionCallBack: () {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
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
          messageStyle: AppStyles.semiBold12SkyBlue,
          titleStyle: AppStyles.semiBold16White,
          posActionStyle: AppStyles.semiBold16White,
          posActionName: 'OK',
        );
      }
    }
  }
}
