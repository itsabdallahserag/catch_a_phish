import 'package:catch_a_phish/core/utils/app_colors.dart';
import 'package:catch_a_phish/ui/auth/rusablewidget/login_form.dart';
import 'package:catch_a_phish/ui/auth/rusablewidget/login_or_register_tab.dart';
import 'package:catch_a_phish/ui/auth/rusablewidget/register_form.dart';
import 'package:flutter/material.dart';

class ContainerLoginOrSignUp extends StatefulWidget {
  const ContainerLoginOrSignUp({super.key});

  @override
  State<ContainerLoginOrSignUp> createState() => _ContainerLoginOrSignUpState();
}

class _ContainerLoginOrSignUpState extends State<ContainerLoginOrSignUp> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.transparentBlack,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            LoginOrRegisterTab(
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
                  : const RegisterForm(),
            ),
          ],
        ),
      ),
    );
  }
}
