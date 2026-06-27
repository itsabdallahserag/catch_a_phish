import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/custom_text_field.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Urltextfield extends StatelessWidget {
  final TextEditingController controller;
  final void Function()? pasteOnPressed;

  const Urltextfield({
    super.key,
    required this.controller,
    required this.pasteOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.purple15,
        borderRadius: BorderRadius.circular(12),
      ),
      child: CustomTextField(
        borderSideColor: AppColors.transparent,
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context)!.pleaseEnterUrl;
          }

          Uri? uri = Uri.tryParse(value);

          if (uri == null ||
              (uri.scheme != "http" && uri.scheme != "https") ||
              uri.host.isEmpty) {
            return AppLocalizations.of(context)!.invalidUrl;
          }

          return null;
        },
        cursorColor: AppColors.white,
        hintStyle: AppStyles.regular16White,
        style: AppStyles.regular16White,
        hintText: AppLocalizations.of(context)!.enterUrlToScan,
        prefixIcon: Image.asset(AppImages.iconUrl, height: 24, width: 24),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(6.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.darkCharcoal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: pasteOnPressed,
            child: Text(
              AppLocalizations.of(context)!.paste,
              style: AppStyles.bold10MintGreen,
            ),
          ),
        ),
      ),
    );
  }
}
