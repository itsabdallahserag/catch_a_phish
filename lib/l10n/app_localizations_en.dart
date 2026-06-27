// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get signUp => 'Sign Up';

  @override
  String get enterYourName => 'Enter your Name';

  @override
  String get name => 'Name';

  @override
  String get nameRequired => 'Name is required';

  @override
  String get enterYourEmail => 'Enter your email';

  @override
  String get email => 'Email';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get enterValidEmail => 'Enter a valid email';

  @override
  String get enterYourPassword => 'Enter your password';

  @override
  String get password => 'Password';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordMinLength => 'Password must be at least 8 characters';

  @override
  String get passwordUppercase =>
      'Password must contain at least one uppercase letter';

  @override
  String get passwordNumber => 'Password must contain at least one number';

  @override
  String get confirmYourPassword => 'Confirm your password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get rememberMe => 'Remember me';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get accessSecureTerminal => 'ACCESS SECURE TERMINAL';

  @override
  String get orContinueWith => 'OR CONTINUE WITH';

  @override
  String get verifyYourEmail => 'Verify Your Email';

  @override
  String get verificationEmailSent =>
      'We sent a verification email. Please check your inbox and verify, then login again.';

  @override
  String get verificationEmailSentToUser =>
      'We sent a verification email. Please verify and login.';

  @override
  String get success => 'Success';

  @override
  String get ok => 'OK';

  @override
  String get welcomeUser => 'Welcome';

  @override
  String get loginFailed => 'Login Failed';

  @override
  String get signUpFailed => 'Sign Up Failed';

  @override
  String get unknownError => 'Unknown Error';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get googleSignInCancelled => 'Google sign in was cancelled';

  @override
  String get cancel => 'Cancel';

  @override
  String get home => 'Home';

  @override
  String get history => 'History';

  @override
  String get profile => 'Profile';

  @override
  String get settings => 'Settings';

  @override
  String get minutesAgo => 'min ago';

  @override
  String get hoursAgo => 'hour ago';

  @override
  String get daysAgo => 'day ago';

  @override
  String get cleanScan => 'Clean Scan';

  @override
  String get phishing => 'Phishing';

  @override
  String get safe => 'Safe';

  @override
  String get malicious => 'Malicious';

  @override
  String get scanHistory => 'Scan History';

  @override
  String get recentActivity => 'Recent Activity';

  @override
  String get clearHistory => 'Clear History';

  @override
  String get clear => 'Clear';

  @override
  String get clearAllScansConfirmation =>
      'Are you sure you want to clear all scans?';

  @override
  String get noHistoryYet => 'No history yet';

  @override
  String get messageScan => 'Message Scan';

  @override
  String get messageScanDescription =>
      'Analyze SMS, email or technical text payloads for malicious strings.';

  @override
  String get threatAnalysisReport => 'Threat Analysis Report';

  @override
  String get phishingProbability => 'PHISHING PROBABILITY';

  @override
  String get legitimate => 'Legitimate';

  @override
  String get spamScore => 'Spam Score';

  @override
  String get highPhishingRisk => 'HIGH PHISHING RISK';

  @override
  String get smsFilteringDisabled => 'SMS Filtering is disabled';

  @override
  String get pleaseEnterMessage => 'Please enter a message to scan';

  @override
  String get enterMessageToScan => 'Enter message to scan';

  @override
  String get noResultYet => 'No result yet';

  @override
  String get phishingDetected => '⚠️ Phishing Detected';

  @override
  String get maliciousMessageNotification =>
      'The message you scanned is malicious';

  @override
  String get analyzeMessage => 'Analyze Message';

  @override
  String get aiTacticalInsight => 'AI Tactical Insight';

  @override
  String get confidenceScore => 'CONFIDENCE SCORE';

  @override
  String get mlProbability => 'ML PROBABILITY';

  @override
  String get finalVerdict => 'FINAL VERDICT';

  @override
  String get urlAppearsSafe => 'URL APPEARS SAFE';

  @override
  String get urlAppearsUnsafe => 'URL APPEARS UNSAFE';

  @override
  String get prediction => 'Prediction';

  @override
  String get riskLevel => 'RISK LEVEL';

  @override
  String get legitimateProbability => 'LEGITIMATE PROBABILITY';

  @override
  String get scanUrl => 'Scan URL';

  @override
  String get urlScanDescription =>
      'Check links before you click. Cross-references 50+ threat databases.';

  @override
  String get urlScreenshot => 'Screenshot of the URL\'s landing page';

  @override
  String get reportThisUrl => 'REPORT THIS URL';

  @override
  String get urlAnalysisDisclaimer =>
      'Analysis based on real-time heuristics and crowdsourced intelligence. Always verify the sender of the link.';

  @override
  String get pleaseEnterUrl => 'Please enter URL';

  @override
  String get invalidUrl => 'Invalid URL';

  @override
  String get enterUrlToScan => 'Enter URL to scan';

  @override
  String get paste => 'PASTE';

  @override
  String get safePreview => 'Safe Preview';

  @override
  String get previewing => 'Previewing';

  @override
  String get navigationBlocked => 'Navigation blocked';

  @override
  String get scanning => 'Scanning...';

  @override
  String get openSafePreview => 'Open Safe Preview';

  @override
  String get blockedUnsafeUrl => 'Blocked: URL marked as unsafe';

  @override
  String get failedToScanUrl => 'Failed to scan URL';

  @override
  String get urlScan => 'URL Scan';

  @override
  String get maliciousUrlNotification => 'The URL you scanned is malicious';

  @override
  String get systemShield => 'System Shield';

  @override
  String get engaged => 'Engaged';

  @override
  String get realTimeMonitoring => 'Real-time heuristics monitoring active.';

  @override
  String get tacticalOverview => 'Tactical Overview';

  @override
  String get scans => 'SCANS';

  @override
  String get threatsDetected => 'THREATS DETECTED';

  @override
  String get emailVerified => 'Email Verified';

  @override
  String get emailNotVerified => 'Email Not Verified';

  @override
  String get emailSent => 'Email Sent';

  @override
  String get checkInboxVerifyEmail => 'Check your inbox and verify your email.';

  @override
  String get resendVerificationEmail => 'Resend Verification Email';

  @override
  String get totalScans => 'Total Scans';

  @override
  String get threatsBlocked => 'Threats Blocked';

  @override
  String get noUserFound => 'No user found';

  @override
  String get accountSecurity => 'Account Security';

  @override
  String get enhancedProtection => 'Enhanced Protection';

  @override
  String get activePremium => 'Active • Premium';

  @override
  String get twoFactorEnabled => 'Two-factor enabled';

  @override
  String get alertPreferences => 'Alert Preferences';

  @override
  String get immediateNotifications => 'Immediate notifications';

  @override
  String get signOut => 'Sign Out';

  @override
  String get signOutConfirmation => 'Are you sure you want to sign out?';

  @override
  String get preferences => 'Preferences';

  @override
  String get notifications => 'Notifications';

  @override
  String get immediateThreatAlerts => 'Immediate threat alerts';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get oledOptimizedInterface => 'OLED optimized interface';

  @override
  String get language => 'Language';

  @override
  String get englishUs => 'English (US)';

  @override
  String get arabic => 'Arabic';

  @override
  String get resources => 'Resources';

  @override
  String get helpCenter => 'Help Center';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get security => 'Security';

  @override
  String get realTimeProtection => 'Real Time Protection';

  @override
  String get scanningIncomingLinks => 'Scanning all incoming links';

  @override
  String get deepInspection => 'Deep Inspection';

  @override
  String get extendedSandboxAnalysis => 'Extended sandbox analysis';

  @override
  String get smsFiltering => 'SMS Filtering';

  @override
  String get blockMaliciousMessages => 'Block malicious text messages';

  @override
  String get english => 'English';

  @override
  String get authentication => 'authentication';
}
