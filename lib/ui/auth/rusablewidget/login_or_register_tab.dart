import 'package:catch_a_phish/core/utils/app_colors.dart';
import 'package:catch_a_phish/ui/auth/rusablewidget/auth_tab.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterTab extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;
  const LoginOrRegisterTab({super.key,required this.selectedIndex,required this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          AuthTab(
            title: 'Login',
            isSelected: selectedIndex == 0,
            onTap: () {
              onTabChanged(0);
            },
          ),
          AuthTab(
            title: 'Register',
            isSelected: selectedIndex == 1,
            onTap: () {
              onTabChanged(1);
            },
          ),
        ],
      ),
    );
  }
}