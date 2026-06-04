import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Ui/auth/auth_screen.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/auth_action_button.dart';
import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AuthActionButton(
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const AuthScreen()),
              (route) => false,
            );
          },
          gradientColors: [AppColors.background, AppColors.coral],
          child: Text('log out'),
        ),
      ),
    );
  }
}
