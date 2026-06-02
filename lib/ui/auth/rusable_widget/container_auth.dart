import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Ui/auth/rusable_widget/container_auth_tab.dart';
import 'package:catch_a_phish/Ui/auth/rusable_widget/container_auth_widgets/form_login_or_signup/login_form.dart';
import 'package:catch_a_phish/Ui/auth/rusable_widget/container_auth_widgets/form_login_or_signup/signup_form.dart';
import 'package:flutter/material.dart';

class ContainerAuth extends StatefulWidget {
  const ContainerAuth({super.key});

  @override
  State<ContainerAuth> createState() => _ContainerAuthState();
}

class _ContainerAuthState extends State<ContainerAuth> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            ContainerAuthTab(
              selectedIndex: selectedIndex,
              onTabChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: selectedIndex == 0
                  ? const LoginForm()
                  : const SignUpForm(),
            ),
          ],
        ),
      ),
    );
  }
}
