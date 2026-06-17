import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_dialog_utils.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Core/utils/notification_service.dart';
import 'package:catch_a_phish/Firbase_utils/firebase_utils.dart';
import 'package:catch_a_phish/Firbase_utils/models/scan_history_model.dart';
import 'package:catch_a_phish/Firbase_utils/models/user_model.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/auth_action_button.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan/url_scan_widgets/url_content_button.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan/url_scan_widgets/url_scan_result.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan/url_scan_widgets/url_text_field.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan/webview/web_view_screen.dart';
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
  bool canOpenWebsite = false;
  bool isUrlValid = false;
  UrlResponce? urlResult;
  ScreenShootResponce? screenResult;
  TextEditingController controller = TextEditingController();
  UserModel? user;

  @override
  void initState() {
    super.initState();
    setupControllerListener();
    getUser();
  }

  Future<void> getUser() async {
    user = await FirebaseUtils.readUser();
    if (!mounted) return;
    setState(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
                  Urltextfield(controller: controller, pasteOnPressed: paste),
                  SizedBox(height: height * 0.02),
                  AuthActionButton(
                    gradientColors: [
                      AppColors.neonBlue,
                      AppColors.midnightBlue,
                    ],
                    onTap: (!isUrlValid || isLoading)
                        ? null
                        : checkUrl, // focus used or not and ya abdallah
                    child: isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.black,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Scanning...",
                                style: AppStyles.medium16Black,
                              ),
                            ],
                          )
                        : UrlContentButton(),
                  ),
                  urlResult != null
                      ? UrlScanResult(
                          screenResult: screenResult,
                          urlResult: urlResult,
                        )
                      : const SizedBox.shrink(),
                  if (canOpenWebsite)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: AuthActionButton(
                        gradientColors: [
                          AppColors.neonBlue,
                          AppColors.midnightBlue,
                        ],
                        onTap: openSafePreview,
                        child: const Text(
                          "Open Safe Preview",
                          style: AppStyles.medium16Black,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setupControllerListener() {
    controller.addListener(() {
      setState(() {
        isUrlValid = controller.text.trim().isNotEmpty;
      });
    });
  }

  void openSafePreview() {
    if (controller.text.trim().isEmpty) return;
    if (!canOpenWebsite) {
      AppDialogUtils.showMessage(
        context: context,
        message: "Blocked: URL marked as unsafe",
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WebViewScreen(url: controller.text.trim()),
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
    startLoading();
    try {
      final response = await ApiManager.urlCheck(controller.text.trim());
      if (user?.notifications == true &&
          response.prediction?.toLowerCase() == 'phishing') {
        await NotificationService.showNotification(
          title: '⚠️ Phishing Detected',
          body: 'The URL you scanned is malicious',
        );
      }
      if (user?.realTimeProtection == true) {
        canOpenWebsite = isSafeWebsite(response.prediction);
      } else {
        canOpenWebsite = true;
      }
      if (!mounted) return;
      if (response.detail != null) {
        AppDialogUtils.showMessage(context: context, message: response.detail!);

        return;
      }
      final screenResponse = await fetchScreenshot(response.screenshotScanId);
      if (!mounted) return;
      await FirebaseUtils.addScan(
        ScanHistoryModel(
          url: controller.text.trim(),
          result: response.prediction,
          createdAt: DateTime.now(),
        ),
      );
      updateResults(response, screenResponse);
    } catch (e) {
      debugPrint(e.toString());
      if (!mounted) return;
      resetResults();
      AppDialogUtils.showMessage(
        context: context,
        message: "Failed to scan URL",
      );
    } finally {
      stopLoading();
    }
  }

  void startLoading() {
    setState(() {
      isLoading = true;
      urlResult = null;
      screenResult = null;
      canOpenWebsite = false;
    });
  }

  void stopLoading() {
    if (!mounted) return;

    setState(() {
      isLoading = false;
    });
  }

  void resetResults() {
    setState(() {
      urlResult = null;
      screenResult = null;
      canOpenWebsite = false;
    });
  }

  bool isSafeWebsite(String? prediction) {
    return prediction?.toLowerCase() == "legitimate";
  }

  Future<ScreenShootResponce?> fetchScreenshot(String? id) async {
    if (id == null) return null;
    return ApiManager.getScreenShoot(id);
  }

  void updateResults(UrlResponce response, ScreenShootResponce? screen) {
    setState(() {
      urlResult = response;
      screenResult = screen;
    });
  }
}
