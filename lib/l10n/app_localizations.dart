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

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @flutterDemo.
  ///
  /// In en, this message translates to:
  /// **'Flutter Demo'**
  String get flutterDemo;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

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

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get rememberMe;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @accessSecureTerminal.
  ///
  /// In en, this message translates to:
  /// **'Access Secure Terminal'**
  String get accessSecureTerminal;

  /// No description provided for @orContinueWith.
  ///
  /// In en, this message translates to:
  /// **'Or Continue With'**
  String get orContinueWith;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @messageScan.
  ///
  /// In en, this message translates to:
  /// **'Message Scan'**
  String get messageScan;

  /// No description provided for @urlScan.
  ///
  /// In en, this message translates to:
  /// **'URL Scan'**
  String get urlScan;

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

  /// No description provided for @tacticalOverview.
  ///
  /// In en, this message translates to:
  /// **'Tactical Overview'**
  String get tacticalOverview;

  /// No description provided for @scansToday.
  ///
  /// In en, this message translates to:
  /// **'Scans Today'**
  String get scansToday;

  /// No description provided for @threatsDetected.
  ///
  /// In en, this message translates to:
  /// **'Threats Detected'**
  String get threatsDetected;

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

  /// No description provided for @systemShieldEngaged.
  ///
  /// In en, this message translates to:
  /// **'System Shield: Engaged'**
  String get systemShieldEngaged;

  /// No description provided for @messageScanDescription.
  ///
  /// In en, this message translates to:
  /// **'Analyze SMS, email, or text messages for phishing indicators.'**
  String get messageScanDescription;

  /// No description provided for @urlScanDescription.
  ///
  /// In en, this message translates to:
  /// **'Check links before opening them for phishing threats.'**
  String get urlScanDescription;

  /// No description provided for @recentScans.
  ///
  /// In en, this message translates to:
  /// **'Recent Scans'**
  String get recentScans;

  /// No description provided for @viewHistory.
  ///
  /// In en, this message translates to:
  /// **'View History'**
  String get viewHistory;

  /// No description provided for @recentActivity.
  ///
  /// In en, this message translates to:
  /// **'Recent Activity'**
  String get recentActivity;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearAll;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @analyzeMessage.
  ///
  /// In en, this message translates to:
  /// **'Analyze Message'**
  String get analyzeMessage;

  /// No description provided for @threatAnalysisReport.
  ///
  /// In en, this message translates to:
  /// **'Threat Analysis Report'**
  String get threatAnalysisReport;

  /// No description provided for @phishingProbability.
  ///
  /// In en, this message translates to:
  /// **'Phishing Probability'**
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
  /// **'High Phishing Risk'**
  String get highPhishingRisk;

  /// No description provided for @aiTacticalInsight.
  ///
  /// In en, this message translates to:
  /// **'AI Tactical Insight'**
  String get aiTacticalInsight;

  /// No description provided for @sourceIp.
  ///
  /// In en, this message translates to:
  /// **'Source IP'**
  String get sourceIp;

  /// No description provided for @encryption.
  ///
  /// In en, this message translates to:
  /// **'Encryption'**
  String get encryption;

  /// No description provided for @scanUrl.
  ///
  /// In en, this message translates to:
  /// **'Scan URL'**
  String get scanUrl;

  /// No description provided for @paste.
  ///
  /// In en, this message translates to:
  /// **'Paste'**
  String get paste;

  /// No description provided for @finalVerdict.
  ///
  /// In en, this message translates to:
  /// **'Final Verdict'**
  String get finalVerdict;

  /// No description provided for @urlAppearsSafe.
  ///
  /// In en, this message translates to:
  /// **'URL Appears Safe'**
  String get urlAppearsSafe;

  /// No description provided for @structureAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Structure Analysis'**
  String get structureAnalysis;

  /// No description provided for @protocol.
  ///
  /// In en, this message translates to:
  /// **'Protocol'**
  String get protocol;

  /// No description provided for @domain.
  ///
  /// In en, this message translates to:
  /// **'Domain'**
  String get domain;

  /// No description provided for @pathAndParams.
  ///
  /// In en, this message translates to:
  /// **'Path & Parameters'**
  String get pathAndParams;

  /// No description provided for @reportThisUrl.
  ///
  /// In en, this message translates to:
  /// **'Report This URL'**
  String get reportThisUrl;

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

  /// No description provided for @authentication.
  ///
  /// In en, this message translates to:
  /// **'Authentication'**
  String get authentication;

  /// No description provided for @twoFactorEnabled.
  ///
  /// In en, this message translates to:
  /// **'Two-Factor Enabled'**
  String get twoFactorEnabled;

  /// No description provided for @alertPreferences.
  ///
  /// In en, this message translates to:
  /// **'Alert Preferences'**
  String get alertPreferences;

  /// No description provided for @immediateNotifications.
  ///
  /// In en, this message translates to:
  /// **'Immediate Notifications'**
  String get immediateNotifications;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @realTimeProtection.
  ///
  /// In en, this message translates to:
  /// **'Real-time Protection'**
  String get realTimeProtection;

  /// No description provided for @deepInspection.
  ///
  /// In en, this message translates to:
  /// **'Deep Inspection'**
  String get deepInspection;

  /// No description provided for @smsFiltering.
  ///
  /// In en, this message translates to:
  /// **'SMS Filtering'**
  String get smsFiltering;

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

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

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

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @premium.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premium;
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
