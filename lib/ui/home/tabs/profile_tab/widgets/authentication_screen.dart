import 'package:catch_a_phish/Core/utils/app_colors.dart';
import 'package:catch_a_phish/Core/utils/app_dialog_utils.dart';
import 'package:catch_a_phish/Core/utils/app_styles.dart';
import 'package:catch_a_phish/Firbase_utils/firebase_utils.dart';
import 'package:catch_a_phish/Ui/auth/custom_widgets/auth_action_button.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool isVerified = FirebaseUtils.isEmailVerified();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.glassGrey,
        title: Text(
          AppLocalizations.of(context)!.authentication,
          style: AppStyles.light24White,
        ),
      ),
      backgroundColor: AppColors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isVerified ? Icons.verified : Icons.cancel,
              color: isVerified ? Colors.green : Colors.red,
              size: 80,
            ),
            SizedBox(height: 20),
            Text(
              isVerified
                  ? AppLocalizations.of(context)!.emailVerified
                  : AppLocalizations.of(context)!.emailNotVerified,
              style: AppStyles.semiBold18White,
            ),
            SizedBox(height: 20),
            if (!isVerified)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AuthActionButton(
                  gradientColors: [AppColors.neonBlue, AppColors.midnightBlue],
                  onTap: () async {
                    await FirebaseUtils.sendEmailVerification();
                    if (!mounted) return;
                    if (context.mounted) {
                      AppDialogUtils.showMessage(
                        context: context,
                        title: AppLocalizations.of(context)!.emailSent,
                        message: AppLocalizations.of(
                          context,
                        )!.checkInboxVerifyEmail,
                        posActionName: AppLocalizations.of(context)!.ok,
                        posActionCallBack: () => Navigator.pop(context),
                      );
                    }
                  },
                  child: Text(
                    AppLocalizations.of(context)!.resendVerificationEmail,
                    style: AppStyles.medium16Black,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
