// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get enterYourName => 'أدخل اسمك';

  @override
  String get name => 'الاسم';

  @override
  String get nameRequired => 'الاسم مطلوب';

  @override
  String get enterYourEmail => 'أدخل بريدك الإلكتروني';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get emailRequired => 'البريد الإلكتروني مطلوب';

  @override
  String get enterValidEmail => 'أدخل بريدًا إلكترونيًا صحيحًا';

  @override
  String get enterYourPassword => 'أدخل كلمة المرور';

  @override
  String get password => 'كلمة المرور';

  @override
  String get passwordRequired => 'كلمة المرور مطلوبة';

  @override
  String get passwordMinLength =>
      'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل';

  @override
  String get passwordUppercase =>
      'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل';

  @override
  String get passwordNumber =>
      'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل';

  @override
  String get confirmYourPassword => 'أكد كلمة المرور';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get passwordsDoNotMatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get rememberMe => 'تذكرني';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get accessSecureTerminal => 'الدخول الآمن';

  @override
  String get orContinueWith => 'أو المتابعة باستخدام';

  @override
  String get verifyYourEmail => 'تحقق من بريدك الإلكتروني';

  @override
  String get verificationEmailSent =>
      'لقد أرسلنا رسالة تحقق إلى بريدك الإلكتروني. يرجى التحقق منه ثم تسجيل الدخول.';

  @override
  String get verificationEmailSentToUser =>
      'لقد أرسلنا رسالة تحقق . يرجى التحقق منها ثم تسجيل الدخول.';

  @override
  String get success => 'نجاح';

  @override
  String get ok => 'حسناً';

  @override
  String get welcomeUser => 'مرحباً';

  @override
  String get loginFailed => 'فشل تسجيل الدخول';

  @override
  String get signUpFailed => 'فشل إنشاء الحساب';

  @override
  String get unknownError => 'خطأ غير معروف';

  @override
  String get cancelled => 'تم الإلغاء';

  @override
  String get googleSignInCancelled => 'تم إلغاء تسجيل الدخول بواسطة Google';

  @override
  String get home => 'الرئيسية';

  @override
  String get history => 'السجل';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get settings => 'الإعدادات';
}
