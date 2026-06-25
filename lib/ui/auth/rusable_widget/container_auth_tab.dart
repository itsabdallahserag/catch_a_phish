import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Ui/auth/rusable_widget/container_auth_widgets/tab_content/auth_tab.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ContainerAuthTab extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;
  const ContainerAuthTab({super.key,required this.selectedIndex,required this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          AuthTab(
            title: AppLocalizations.of(context)!.login,
            isSelected: selectedIndex == 0,
            onTap: () {
              onTabChanged(0);
            },
          ),
          AuthTab(
            title: AppLocalizations.of(context)!.signUp,
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