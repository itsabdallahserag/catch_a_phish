import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Enter your Name'**
  String get enterYourName;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameRequired;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @enterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get enterValidEmail;

  /// No description provided for @enterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterYourPassword;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordMinLength;

  /// No description provided for @passwordUppercase.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase letter'**
  String get passwordUppercase;

  /// No description provided for @passwordNumber.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one number'**
  String get passwordNumber;

  /// No description provided for @confirmYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm your password'**
  String get confirmYourPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @accessSecureTerminal.
  ///
  /// In en, this message translates to:
  /// **'ACCESS SECURE TERMINAL'**
  String get accessSecureTerminal;

  /// No description provided for @orContinueWith.
  ///
  /// In en, this message translates to:
  /// **'OR CONTINUE WITH'**
  String get orContinueWith;

  /// No description provided for @verifyYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Verify Your Email'**
  String get verifyYourEmail;

  /// No description provided for @verificationEmailSent.
  ///
  /// In en, this message translates to:
  /// **'We sent a verification email. Please check your inbox and verify, then login again.'**
  String get verificationEmailSent;

  /// No description provided for @verificationEmailSentToUser.
  ///
  /// In en, this message translates to:
  /// **'We sent a verification email. Please verify and login.'**
  String get verificationEmailSentToUser;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @welcomeUser.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcomeUser;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login Failed'**
  String get loginFailed;

  /// No description provided for @signUpFailed.
  ///
  /// In en, this message translates to:
  /// **'Sign Up Failed'**
  String get signUpFailed;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown Error'**
  String get unknownError;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @googleSignInCancelled.
  ///
  /// In en, this message translates to:
  /// **'Google sign in was cancelled'**
  String get googleSignInCancelled;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @minutesAgo.
  ///
  /// In en, this message translates to:
  /// **'min ago'**
  String get minutesAgo;

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'hour ago'**
  String get hoursAgo;

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'day ago'**
  String get daysAgo;

  /// No description provided for @cleanScan.
  ///
  /// In en, this message translates to:
  /// **'Clean Scan'**
  String get cleanScan;

  /// No description provided for @phishing.
  ///
  /// In en, this message translates to:
  /// **'Phishing'**
  String get phishing;

  /// No description provided for @safe.
  ///
  /// In en, this message translates to:
  /// **'Safe'**
  String get safe;

  /// No description provided for @malicious.
  ///
  /// In en, this message translates to:
  /// **'Malicious'**
  String get malicious;

  /// No description provided for @scanHistory.
  ///
  /// In en, this message translates to:
  /// **'Scan History'**
  String get scanHistory;

  /// No description provided for @recentActivity.
  ///
  /// In en, this message translates to:
  /// **'Recent Activity'**
  String get recentActivity;

  /// No description provided for @clearHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear History'**
  String get clearHistory;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @clearAllScansConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear all scans?'**
  String get clearAllScansConfirmation;

  /// No description provided for @noHistoryYet.
  ///
  /// In en, this message translates to:
  /// **'No history yet'**
  String get noHistoryYet;

  /// No description provided for @messageScan.
  ///
  /// In en, this message translates to:
  /// **'Message Scan'**
  String get messageScan;

  /// No description provided for @messageScanDescription.
  ///
  /// In en, this message translates to:
  /// **'Analyze SMS, email or technical text payloads for malicious strings.'**
  String get messageScanDescription;

  /// No description provided for @threatAnalysisReport.
  ///
  /// In en, this message translates to:
  /// **'Threat Analysis Report'**
  String get threatAnalysisReport;

  /// No description provided for @phishingProbability.
  ///
  /// In en, this message translates to:
  /// **'PHISHING PROBABILITY'**
  String get phishingProbability;

  /// No description provided for @legitimate.
  ///
  /// In en, this message translates to:
  /// **'Legitimate'**
  String get legitimate;

  /// No description provided for @spamScore.
  ///
  /// In en, this message translates to:
  /// **'Spam Score'**
  String get spamScore;

  /// No description provided for @highPhishingRisk.
  ///
  /// In en, this message translates to:
  /// **'HIGH PHISHING RISK'**
  String get highPhishingRisk;

  /// No description provided for @smsFilteringDisabled.
  ///
  /// In en, this message translates to:
  /// **'SMS Filtering is disabled'**
  String get smsFilteringDisabled;

  /// No description provided for @pleaseEnterMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter a message to scan'**
  String get pleaseEnterMessage;

  /// No description provided for @enterMessageToScan.
  ///
  /// In en, this message translates to:
  /// **'Enter message to scan'**
  String get enterMessageToScan;

  /// No description provided for @noResultYet.
  ///
  /// In en, this message translates to:
  /// **'No result yet'**
  String get noResultYet;

  /// No description provided for @phishingDetected.
  ///
  /// In en, this message translates to:
  /// **'⚠️ Phishing Detected'**
  String get phishingDetected;

  /// No description provided for @maliciousMessageNotification.
  ///
  /// In en, this message translates to:
  /// **'The message you scanned is malicious'**
  String get maliciousMessageNotification;

  /// No description provided for @analyzeMessage.
  ///
  /// In en, this message translates to:
  /// **'Analyze Message'**
  String get analyzeMessage;

  /// No description provided for @aiTacticalInsight.
  ///
  /// In en, this message translates to:
  /// **'AI Tactical Insight'**
  String get aiTacticalInsight;

  /// No description provided for @confidenceScore.
  ///
  /// In en, this message translates to:
  /// **'CONFIDENCE SCORE'**
  String get confidenceScore;

  /// No description provided for @mlProbability.
  ///
  /// In en, this message translates to:
  /// **'ML PROBABILITY'**
  String get mlProbability;

  /// No description provided for @finalVerdict.
  ///
  /// In en, this message translates to:
  /// **'FINAL VERDICT'**
  String get finalVerdict;

  /// No description provided for @urlAppearsSafe.
  ///
  /// In en, this message translates to:
  /// **'URL APPEARS SAFE'**
  String get urlAppearsSafe;

  /// No description provided for @urlAppearsUnsafe.
  ///
  /// In en, this message translates to:
  /// **'URL APPEARS UNSAFE'**
  String get urlAppearsUnsafe;

  /// No description provided for @prediction.
  ///
  /// In en, this message translates to:
  /// **'Prediction'**
  String get prediction;

  /// No description provided for @riskLevel.
  ///
  /// In en, this message translates to:
  /// **'RISK LEVEL'**
  String get riskLevel;

  /// No description provided for @legitimateProbability.
  ///
  /// In en, this message translates to:
  /// **'LEGITIMATE PROBABILITY'**
  String get legitimateProbability;

  /// No description provided for @scanUrl.
  ///
  /// In en, this message translates to:
  /// **'Scan URL'**
  String get scanUrl;

  /// No description provided for @urlScanDescription.
  ///
  /// In en, this message translates to:
  /// **'Check links before you click. Cross-references 50+ threat databases.'**
  String get urlScanDescription;

  /// No description provided for @urlScreenshot.
  ///
  /// In en, this message translates to:
  /// **'Screenshot of the URL\'s landing page'**
  String get urlScreenshot;

  /// No description provided for @reportThisUrl.
  ///
  /// In en, this message translates to:
  /// **'REPORT THIS URL'**
  String get reportThisUrl;

  /// No description provided for @urlAnalysisDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Analysis based on real-time heuristics and crowdsourced intelligence. Always verify the sender of the link.'**
  String get urlAnalysisDisclaimer;

  /// No description provided for @pleaseEnterUrl.
  ///
  /// In en, this message translates to:
  /// **'Please enter URL'**
  String get pleaseEnterUrl;

  /// No description provided for @invalidUrl.
  ///
  /// In en, this message translates to:
  /// **'Invalid URL'**
  String get invalidUrl;

  /// No description provided for @enterUrlToScan.
  ///
  /// In en, this message translates to:
  /// **'Enter URL to scan'**
  String get enterUrlToScan;

  /// No description provided for @paste.
  ///
  /// In en, this message translates to:
  /// **'PASTE'**
  String get paste;

  /// No description provided for @safePreview.
  ///
  /// In en, this message translates to:
  /// **'Safe Preview'**
  String get safePreview;

  /// No description provided for @previewing.
  ///
  /// In en, this message translates to:
  /// **'Previewing'**
  String get previewing;

  /// No description provided for @navigationBlocked.
  ///
  /// In en, this message translates to:
  /// **'Navigation blocked'**
  String get navigationBlocked;

  /// No description provided for @scanning.
  ///
  /// In en, this message translates to:
  /// **'Scanning...'**
  String get scanning;

  /// No description provided for @openSafePreview.
  ///
  /// In en, this message translates to:
  /// **'Open Safe Preview'**
  String get openSafePreview;

  /// No description provided for @blockedUnsafeUrl.
  ///
  /// In en, this message translates to:
  /// **'Blocked: URL marked as unsafe'**
  String get blockedUnsafeUrl;

  /// No description provided for @failedToScanUrl.
  ///
  /// In en, this message translates to:
  /// **'Failed to scan URL'**
  String get failedToScanUrl;

  /// No description provided for @urlScan.
  ///
  /// In en, this message translates to:
  /// **'URL Scan'**
  String get urlScan;

  /// No description provided for @maliciousUrlNotification.
  ///
  /// In en, this message translates to:
  /// **'The URL you scanned is malicious'**
  String get maliciousUrlNotification;

  /// No description provided for @systemShield.
  ///
  /// In en, this message translates to:
  /// **'System Shield'**
  String get systemShield;

  /// No description provided for @engaged.
  ///
  /// In en, this message translates to:
  /// **'Engaged'**
  String get engaged;

  /// No description provided for @realTimeMonitoring.
  ///
  /// In en, this message translates to:
  /// **'Real-time heuristics monitoring active.'**
  String get realTimeMonitoring;

  /// No description provided for @tacticalOverview.
  ///
  /// In en, this message translates to:
  /// **'Tactical Overview'**
  String get tacticalOverview;

  /// No description provided for @scans.
  ///
  /// In en, this message translates to:
  /// **'SCANS'**
  String get scans;

  /// No description provided for @threatsDetected.
  ///
  /// In en, this message translates to:
  /// **'THREATS DETECTED'**
  String get threatsDetected;

  /// No description provided for @emailVerified.
  ///
  /// In en, this message translates to:
  /// **'Email Verified'**
  String get emailVerified;

  /// No description provided for @emailNotVerified.
  ///
  /// In en, this message translates to:
  /// **'Email Not Verified'**
  String get emailNotVerified;

  /// No description provided for @emailSent.
  ///
  /// In en, this message translates to:
  /// **'Email Sent'**
  String get emailSent;

  /// No description provided for @checkInboxVerifyEmail.
  ///
  /// In en, this message translates to:
  /// **'Check your inbox and verify your email.'**
  String get checkInboxVerifyEmail;

  /// No description provided for @resendVerificationEmail.
  ///
  /// In en, this message translates to:
  /// **'Resend Verification Email'**
  String get resendVerificationEmail;

  /// No description provided for @totalScans.
  ///
  /// In en, this message translates to:
  /// **'Total Scans'**
  String get totalScans;

  /// No description provided for @threatsBlocked.
  ///
  /// In en, this message translates to:
  /// **'Threats Blocked'**
  String get threatsBlocked;

  /// No description provided for @noUserFound.
  ///
  /// In en, this message translates to:
  /// **'No user found'**
  String get noUserFound;

  /// No description provided for @accountSecurity.
  ///
  /// In en, this message translates to:
  /// **'Account Security'**
  String get accountSecurity;

  /// No description provided for @enhancedProtection.
  ///
  /// In en, this message translates to:
  /// **'Enhanced Protection'**
  String get enhancedProtection;

  /// No description provided for @activePremium.
  ///
  /// In en, this message translates to:
  /// **'Active • Premium'**
  String get activePremium;

  /// No description provided for @twoFactorEnabled.
  ///
  /// In en, this message translates to:
  /// **'Two-factor enabled'**
  String get twoFactorEnabled;

  /// No description provided for @alertPreferences.
  ///
  /// In en, this message translates to:
  /// **'Alert Preferences'**
  String get alertPreferences;

  /// No description provided for @immediateNotifications.
  ///
  /// In en, this message translates to:
  /// **'Immediate notifications'**
  String get immediateNotifications;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @signOutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out?'**
  String get signOutConfirmation;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @immediateThreatAlerts.
  ///
  /// In en, this message translates to:
  /// **'Immediate threat alerts'**
  String get immediateThreatAlerts;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @oledOptimizedInterface.
  ///
  /// In en, this message translates to:
  /// **'OLED optimized interface'**
  String get oledOptimizedInterface;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @englishUs.
  ///
  /// In en, this message translates to:
  /// **'English (US)'**
  String get englishUs;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @resources.
  ///
  /// In en, this message translates to:
  /// **'Resources'**
  String get resources;

  /// No description provided for @helpCenter.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get helpCenter;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @realTimeProtection.
  ///
  /// In en, this message translates to:
  /// **'Real Time Protection'**
  String get realTimeProtection;

  /// No description provided for @scanningIncomingLinks.
  ///
  /// In en, this message translates to:
  /// **'Scanning all incoming links'**
  String get scanningIncomingLinks;

  /// No description provided for @deepInspection.
  ///
  /// In en, this message translates to:
  /// **'Deep Inspection'**
  String get deepInspection;

  /// No description provided for @extendedSandboxAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Extended sandbox analysis'**
  String get extendedSandboxAnalysis;

  /// No description provided for @smsFiltering.
  ///
  /// In en, this message translates to:
  /// **'SMS Filtering'**
  String get smsFiltering;

  /// No description provided for @blockMaliciousMessages.
  ///
  /// In en, this message translates to:
  /// **'Block malicious text messages'**
  String get blockMaliciousMessages;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @authentication.
  ///
  /// In en, this message translates to:
  /// **'authentication'**
  String get authentication;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
