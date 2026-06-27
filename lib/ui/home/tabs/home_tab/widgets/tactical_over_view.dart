import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class TacticalOverView extends StatelessWidget {
  final int totalScans;
  final int threatsBlocked;
  const TacticalOverView({
    super.key,
    required this.totalScans,
    required this.threatsBlocked,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.nightBackground,
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppLocalizations.of(context)!.tacticalOverview,
                    style: AppStyles.semiBold16White,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              '$totalScans',
                              style: AppStyles.semiBold32White,
                            ),
                            SizedBox(height: height * 0.006),
                            Text(
                              AppLocalizations.of(context)!.scans,
                              style: AppStyles.light12White,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: height * 0.08,
                        width: 1,
                        color: AppColors.whiteOverlay18,
                      ),
                      SizedBox(width: width * 0.04),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              '$threatsBlocked',
                              style: AppStyles.semiBold32PinkColor,
                            ),
                            SizedBox(height: height * 0.006),
                            Text(
                              AppLocalizations.of(context)!.threatsDetected,
                              style: AppStyles.light12White,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Image.asset(AppImages.scan, fit: BoxFit.contain)),
        ],
      ),
    );
  }
} /* 
Container(
      padding: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.thirdBlue,
            AppColors.secondaryBlue,
          ],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tactical Overview',
                    style: AppStyles.semiBold16White,
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            '12',
                            style: AppStyles.semiBold32White,
                          ),
                          Text(
                            'SCANS TODAY',
                            style: AppStyles.light12White,
                          ),
                        ],
                      ),

                      const SizedBox(width: 18),

                      Container(
                        height: 45,
                        width: 1,
                        color: Colors.white24,
                      ),

                      const SizedBox(width: 18),

                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            '03',
                            style:
                                AppStyles.semiBold32PinkColor,
                          ),
                          Text(
                            'THREATS DETECTED',
                            style: AppStyles.light12White,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
              child: Image.asset(
                AppImages.scan,
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
 */
