import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Welcome to the Settings Tab!',
          style: AppStyles.semiBold16White,
        ),
      ),
    );
  }
}