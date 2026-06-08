import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/auth_action_button.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan/url_scan_widgets/url_content_button.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan/url_scan_widgets/url_scan_result.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan/url_scan_widgets/url_text_field.dart';
import 'package:catch_a_phish/api/api_manager.dart';
import 'package:catch_a_phish/api/models/url/ScreenShootResponce.dart';
import 'package:catch_a_phish/api/models/url/UrlResponce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UrlScanScreen extends StatefulWidget {
  const UrlScanScreen({super.key});

  @override
  State<UrlScanScreen> createState() => _UrlScanScreenState();
}

class _UrlScanScreenState extends State<UrlScanScreen> {
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;
  UrlResponce? urlResult;
  ScreenShootResponce? screenResult;
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
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Urltextfield(controller:controller ,pasteOnPressed:() => paste() ,),
                  SizedBox(height: height * 0.02),
                  AuthActionButton(
                    gradientColors: [
                      AppColors.neonBlue,
                      AppColors.midnightBlue,
                    ],
                    onTap: isLoading ? null : checkUrl,
                    child: isLoading
                        ? CircularProgressIndicator(color: AppColors.white)
                        :UrlContentButton()
                  ),
                  urlResult != null
                      ? UrlScanResult(screenResult: screenResult,urlResult:urlResult ,)
                      : SizedBox.shrink(),
                ],
              ),
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

  Future<void> checkUrl() async {
    FocusScope.of(context).unfocus();
    if (!formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
      urlResult = null;
      screenResult = null;
    });

    try {
      final response = await ApiManager.urlCheck(controller.text.trim());
      if (!mounted) return;

      if (response.detail != null) {
        setState(() {
          urlResult = null;
          screenResult = null;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(response.detail!),
          ),
        );

        return;
      }

      ScreenShootResponce? screenResponse;

      if (response.screenshotScanId != null) {
        screenResponse = await ApiManager.getScreenShoot(
          response.screenshotScanId!,
        );
      }
      if (!mounted) return;

      setState(() {
        urlResult = response;
        screenResult = screenResponse;
      });
    } catch (e) {
      debugPrint(e.toString());

      if (!mounted) return;

      setState(() {
        urlResult = null;
        screenResult = null;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Failed to scan URL")));
    } finally {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });
    }
  }
}
