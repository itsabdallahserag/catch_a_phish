import 'package:catch_a_phish/core/utils/app_colors.dart';
import 'package:catch_a_phish/core/utils/app_images.dart';
import 'package:catch_a_phish/core/utils/app_routes.dart';
import 'package:catch_a_phish/core/utils/app_styles.dart';
import 'package:catch_a_phish/ui/auth/custom_widgets/auth_action_button.dart';
import 'package:catch_a_phish/ui/auth/custom_widgets/auth_social_widget.dart';
import 'package:catch_a_phish/ui/auth/custom_widgets/custom_text_field.dart';
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
                return null;
              },
              controller: emailController,
              hintText: 'email@example.com',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Image.asset(
                AppImages.iconEmail,
                color: AppColors.primaryColor,
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
                return null;
              },
              controller: passwordController,
              hintText: 'Password',
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Image.asset(
                AppImages.iconPassword,
                color: AppColors.primaryColor,
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
            AuthActionButton(onTap: () { login(); },),
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
  void  login() {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, AppRoutes.home);
      print('Email: ${emailController.text}, Password: ${passwordController.text}');
    }
  }
}
