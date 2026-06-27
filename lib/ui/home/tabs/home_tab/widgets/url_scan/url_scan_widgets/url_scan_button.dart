import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan/url_scan_screen.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class UrlScanButton extends StatelessWidget {
  const UrlScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                UrlScanScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 16, left: 24, top: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [AppColors.blackOverlay80, AppColors.deepBlue],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.darkGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(AppImages.iconUrl),
                ),
                const Spacer(),
              ],
            ),
            SizedBox(height: height * 0.03),
            Text(
              AppLocalizations.of(context)!.urlScan,
              style: AppStyles.semiBold20White,
            ),
            Text(
              AppLocalizations.of(context)!.urlScanDescription,
              style: AppStyles.semiLight12LightGrey,
            ),
          ],
        ),
      ),
    );
  }
}
