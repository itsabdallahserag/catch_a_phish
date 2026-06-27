import 'package:animate_do/animate_do.dart';
import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_dialog_utils.dart';
import 'package:catch_a_phish/Core/utils/app_images.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Core/utils/notification_service.dart';
import 'package:catch_a_phish/Firbase_utils/firebase_utils.dart';
import 'package:catch_a_phish/Firbase_utils/models/user_model.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/auth_action_button.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/custom_text_field.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/message_scan/message_scan_widgets/threat_analysis_report.dart';
import 'package:catch_a_phish/api/api_manager.dart';
import 'package:catch_a_phish/api/models/message/PredictResponce.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class MessageScanScreen extends StatefulWidget {
  const MessageScanScreen({super.key});

  @override
  State<MessageScanScreen> createState() => _MessageScanScreenState();
}

class _MessageScanScreenState extends State<MessageScanScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  bool isLoading = false;
  PredictResponce? result;
  UserModel? user;

  @override
  void initState() {
    super.initState();
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

  Future<void> checkMessage() async {
    if (user?.smsFiltering == false) {
      AppDialogUtils.showMessage(
        context: context,
        message: AppLocalizations.of(context)!.smsFilteringDisabled,
        negActionName: AppLocalizations.of(context)!.ok,
      );
      return;
    }

    if (!formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
      result = null;
    });

    try {
      final response = await ApiManager.spamCheck(controller.text);
      if (!mounted) return;
      if (user?.notifications == true &&
          response.label?.toLowerCase() == 'phishing') {
        await NotificationService.showNotification(
          title: AppLocalizations.of(context)!.phishingDetected,
          body: AppLocalizations.of(context)!.maliciousMessageNotification,
        );
      }

      if (!mounted) return;

      setState(() {
        result = response;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        result = null;
      });
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
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
          title: Text(
            AppLocalizations.of(context)!.messageScan,
            style: AppStyles.light24White,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.blackOverlay40,
                    ),
                    child: CustomTextField(
                      controller: controller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(
                            context,
                          )!.pleaseEnterMessage;
                        }
                        return null;
                      },
                      cursorColor: AppColors.white,
                      hintStyle: AppStyles.regular16White,
                      style: AppStyles.regular16White,
                      hintText: AppLocalizations.of(
                        context,
                      )!.enterMessageToScan,
                      maxLines: 8,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  AuthActionButton(
                    gradientColors: [
                      AppColors.neonBlue,
                      AppColors.midnightBlue,
                    ],
                    onTap: isLoading ? null : checkMessage,
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: AppColors.navyBackground,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.iconAnalyze,
                                height: 24,
                                width: 24,
                              ),
                              SizedBox(width: width * 0.02),
                              Text(
                                AppLocalizations.of(context)!.analyzeMessage,
                                style: AppStyles.medium16Black,
                              ),
                            ],
                          ),
                  ),
                  SizedBox(height: height * 0.02),
                  result != null
                      ? FadeInUp(
                          from: 50,
                          duration: const Duration(milliseconds: 700),
                          child: ThreatAnalysisReport(result: result!),
                        )
                      : Text(AppLocalizations.of(context)!.noResultYet),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
