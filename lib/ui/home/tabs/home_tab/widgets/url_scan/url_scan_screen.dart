import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/auth_action_button.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/custom_text_field.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan/url_scan_widgets/ai_analysis.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan/url_scan_widgets/final_verdict.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan/url_scan_widgets/linear_probability.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UrlScanScreen extends StatefulWidget {
  const UrlScanScreen({super.key});

  @override
  State<UrlScanScreen> createState() => _UrlScanScreenState();
}

class _UrlScanScreenState extends State<UrlScanScreen> {
  TextEditingController controller = TextEditingController();
   @override
    dispose() {
      controller.dispose();
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.primaryBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          foregroundColor: AppColors.white,
          toolbarHeight: height * 0.08,
          backgroundColor: AppColors.glassGrey,
          elevation: 0,
          centerTitle: true,
          title: Text('URL Scan', style: AppStyles.light24White),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.purple15,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CustomTextField(
                    borderSideColor: AppColors.transparent,
                    controller: controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a URL to scan';
                      }
                      return null;
                    },
                    cursorColor: AppColors.white,
                    hintStyle: AppStyles.regular16White,
                    style: AppStyles.regular16White,
                    hintText: 'Enter URL to scan',
                    prefixIcon: Image.asset(
                      AppImages.iconUrl,
                      height: 24,
                      width: 24,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkCharcoal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => paste(),
                        child: Text("PASTE", style: AppStyles.bold10MintGreen),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                AuthActionButton(
                  gradientColors: [AppColors.neonBlue, AppColors.midnightBlue],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.iconEngaged,
                        color: AppColors.black,
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(width: width * 0.02),
                      Text('Scan URL', style: AppStyles.medium16Black),
                    ],
                  ),
                  onTap: () {},
                ),
                SizedBox(height: height * 0.02),
                FinalVerdict(),
                SizedBox(height: height * 0.02),
                AiAnalysis(),
                SizedBox(height: height * 0.02),
                LinearProbability(iconName: AppImages.iconRisk, percentage: 0.5),
                SizedBox(height: height * 0.02),
                LinearProbability(iconName: AppImages.iconTrue, percentage: 0.9),
                SizedBox(height: height * 0.02),
                Text(
                  'Screenshot of the URL\'s landing page',
                  style: AppStyles.regular12MediumGrey3,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.02),
                Container(
                  height: height * 0.3,
                  clipBehavior: Clip.antiAlias,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: AppColors.blackOverlay50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(AppImages.splash, height: height * 0.08, width: double.infinity, fit: BoxFit.contain),
                ),
                SizedBox(height: height * 0.02),
                AuthActionButton(
                  borderColor: AppColors.red,
                  gradientColors: [AppColors.darkRed50, AppColors.darkRed50],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.iconReport, height: 24, width: 24),
                      SizedBox(width: width * 0.02),
                      Text('REPORT THIS URL', style: AppStyles.medium14Red),
                    ],
                  ),
                  onTap: () {},
                ),
                SizedBox(height: height * 0.02),
                Text(
                  'Analysis based on real-time heuristics and crowdsourced intelligence. Always verify the sender of the link.',
                  style: AppStyles.regular12MediumGrey3,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> paste() async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data != null) {
      controller.text = data.text!;
    }
  }
}
