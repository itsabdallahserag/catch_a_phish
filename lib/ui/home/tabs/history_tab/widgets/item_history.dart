import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Firbase_utils/models/scan_history_model.dart';
import 'package:flutter/material.dart';

class ItemHistory extends StatelessWidget {
  final ScanHistoryModel scan;

  const ItemHistory({super.key, required this.scan});

  bool get isSafe => scan.result == "legitimate";

  String timeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);

    if (diff.inMinutes < 60) {
      return "${diff.inMinutes} min ago";
    } else if (diff.inHours < 24) {
      return "${diff.inHours} hour ago";
    } else {
      return "${diff.inDays} day ago";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.blackOverlay40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.glassGrey,
            ),
            child: Image.asset(AppImages.iconRisk, fit: BoxFit.contain),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  scan.url!,
                  style: AppStyles.regular16White,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  "${timeAgo(scan.createdAt!)} • ${isSafe ? "Clean Scan" : "Phishing"}",
                  style: AppStyles.regular12LightGrey,
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.glassGrey,
            ),
            child: Text(
              isSafe ? "Safe" : "Malicious",
              style: isSafe ? AppStyles.semiBold12Coral : AppStyles.bold12Red,
            ),
          ),
        ],
      ),
    );
  }
}
