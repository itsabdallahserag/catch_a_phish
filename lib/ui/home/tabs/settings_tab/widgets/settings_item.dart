import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String titleItem;
  final String description;
  final bool isActive;
  final ValueChanged<bool> onChanged;
  final bool? isLanguage ;
  final void Function()? onPressedLanguage ;

  const SettingsItem({
    super.key,
    required this.titleItem,
    required this.description,
    required this.isActive,
    required this.onChanged,
    this.isLanguage = false ,
    this.onPressedLanguage
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titleItem, style: AppStyles.regular16White),
            Text(description, style: AppStyles.regular12LightGrey),
          ],
        ),
        const Spacer(),
        isLanguage == false ?
        Transform.scale(
          scale: 0.8,
          child: Switch(
            value: isActive,
            onChanged: onChanged,
            thumbColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.background;
              }
              return AppColors.lightGrey;
            }),
            trackColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.cyan;
              }
              return AppColors.glassGrey;
            }),
          ),
        ):
        IconButton(
          onPressed: onPressedLanguage,
          icon:Icon(Icons.arrow_forward_ios,size: 14, color: AppColors.grey) ,
          )
      ],
    );
  }
}
