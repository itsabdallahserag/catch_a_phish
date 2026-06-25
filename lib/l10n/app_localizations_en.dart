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
  String get home => 'Home';

  @override
  String get history => 'History';

  @override
  String get profile => 'Profile';

  @override
  String get settings => 'Settings';
}
