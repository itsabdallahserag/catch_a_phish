import 'package:cached_network_image/cached_network_image.dart';
import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/api/models/url/ScreenShootResponce.dart';
import 'package:flutter/material.dart';

class ScreenImage extends StatelessWidget {
  final ScreenShootResponce? screenResult;
  const ScreenImage({super.key, required this.screenResult});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return screenResult != null &&
            screenResult!.status == "ready" &&
            screenResult!.screenshotUrl != null
        ? Container(
            height: height * 0.3,
            clipBehavior: Clip.antiAlias,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.blackOverlay50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: CachedNetworkImage(
              imageUrl: screenResult!.screenshotUrl!,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(color: AppColors.white),
              ),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
          )
        : const SizedBox.shrink();
  }
}
