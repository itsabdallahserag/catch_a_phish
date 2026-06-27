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
      'لقد أرسلنا رسالة تحقق. يرجى التحقق منها ثم تسجيل الدخول.';

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
  String get cancel => 'إلغاء';

  @override
  String get home => 'الرئيسية';

  @override
  String get history => 'السجل';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get settings => 'الإعدادات';

  @override
  String get minutesAgo => 'دقيقة مضت';

  @override
  String get hoursAgo => 'ساعة مضت';

  @override
  String get daysAgo => 'يوم مضى';

  @override
  String get cleanScan => 'فحص نظيف';

  @override
  String get phishing => 'تصيد احتيالي';

  @override
  String get safe => 'آمن';

  @override
  String get malicious => 'ضار';

  @override
  String get scanHistory => 'سجل الفحص';

  @override
  String get recentActivity => 'النشاط الأخير';

  @override
  String get clearHistory => 'مسح السجل';

  @override
  String get clear => 'مسح';

  @override
  String get clearAllScansConfirmation =>
      'هل أنت متأكد من حذف جميع عمليات الفحص؟';

  @override
  String get noHistoryYet => 'لا يوجد سجل حتى الآن';

  @override
  String get messageScan => 'فحص الرسائل';

  @override
  String get messageScanDescription =>
      'حلّل الرسائل النصية والبريد الإلكتروني أو أي نص تقني لاكتشاف المحتوى الضار.';

  @override
  String get threatAnalysisReport => 'تقرير تحليل التهديد';

  @override
  String get phishingProbability => 'احتمالية التصيد';

  @override
  String get legitimate => 'سليم';

  @override
  String get spamScore => 'درجة الرسائل المزعجة';

  @override
  String get highPhishingRisk => 'خطر تصيد مرتفع';

  @override
  String get smsFilteringDisabled => 'تصفية الرسائل النصية معطلة';

  @override
  String get pleaseEnterMessage => 'يرجى إدخال رسالة للفحص';

  @override
  String get enterMessageToScan => 'أدخل الرسالة لفحصها';

  @override
  String get noResultYet => 'لا توجد نتيجة حتى الآن';

  @override
  String get phishingDetected => '⚠️ تم اكتشاف تصيد احتيالي';

  @override
  String get maliciousMessageNotification => 'الرسالة التي قمت بفحصها ضارة';

  @override
  String get analyzeMessage => 'تحليل الرسالة';

  @override
  String get aiTacticalInsight => 'تحليل الذكاء الاصطناعي';

  @override
  String get confidenceScore => 'درجة الثقة';

  @override
  String get mlProbability => 'احتمالية التعلم الآلي';

  @override
  String get finalVerdict => 'الحكم النهائي';

  @override
  String get urlAppearsSafe => 'الرابط يبدو آمنًا';

  @override
  String get urlAppearsUnsafe => 'الرابط يبدو غير آمن';

  @override
  String get prediction => 'التنبؤ';

  @override
  String get riskLevel => 'مستوى الخطر';

  @override
  String get legitimateProbability => 'احتمالية الشرعية';

  @override
  String get scanUrl => 'فحص الرابط';

  @override
  String get urlScanDescription =>
      'افحص الروابط قبل النقر عليها. يتحقق من أكثر من 50 قاعدة بيانات للتهديدات.';

  @override
  String get urlScreenshot => 'لقطة شاشة لصفحة الرابط';

  @override
  String get reportThisUrl => 'الإبلاغ عن هذا الرابط';

  @override
  String get urlAnalysisDisclaimer =>
      'التحليل مبني على إرشادات آنية واستخبارات جماعية. تحقق دائمًا من مُرسل الرابط.';

  @override
  String get pleaseEnterUrl => 'يرجى إدخال رابط';

  @override
  String get invalidUrl => 'رابط غير صالح';

  @override
  String get enterUrlToScan => 'أدخل الرابط للفحص';

  @override
  String get paste => 'لصق';

  @override
  String get safePreview => 'المعاينة الآمنة';

  @override
  String get previewing => 'معاينة';

  @override
  String get navigationBlocked => 'تم حظر التنقل';

  @override
  String get scanning => 'جارٍ الفحص...';

  @override
  String get openSafePreview => 'فتح المعاينة الآمنة';

  @override
  String get blockedUnsafeUrl => 'تم الحظر: تم تصنيف الرابط على أنه غير آمن';

  @override
  String get failedToScanUrl => 'فشل في فحص الرابط';

  @override
  String get urlScan => 'فحص الرابط';

  @override
  String get maliciousUrlNotification => 'الرابط الذي قمت بفحصه ضار';

  @override
  String get systemShield => 'درع الحماية';

  @override
  String get engaged => 'مُفعّل';

  @override
  String get realTimeMonitoring =>
      'مراقبة آنية قائمة باستخدام أساليب التحليل الذكية.';

  @override
  String get tacticalOverview => 'نظرة عامة';

  @override
  String get scans => 'عمليات الفحص';

  @override
  String get threatsDetected => 'التهديدات المكتشفة';

  @override
  String get emailVerified => 'تم التحقق من البريد الإلكتروني';

  @override
  String get emailNotVerified => 'لم يتم التحقق من البريد الإلكتروني';

  @override
  String get emailSent => 'تم إرسال البريد الإلكتروني';

  @override
  String get checkInboxVerifyEmail =>
      'تحقق من صندوق الوارد ثم قم بتأكيد بريدك الإلكتروني.';

  @override
  String get resendVerificationEmail => 'إعادة إرسال رسالة التحقق';

  @override
  String get totalScans => 'إجمالي عمليات الفحص';

  @override
  String get threatsBlocked => 'التهديدات المكتشفة';

  @override
  String get noUserFound => 'لم يتم العثور على مستخدم';

  @override
  String get accountSecurity => 'أمان الحساب';

  @override
  String get enhancedProtection => 'الحماية المعززة';

  @override
  String get activePremium => 'مفعل • مميز';

  @override
  String get twoFactorEnabled => 'المصادقة الثنائية مفعلة';

  @override
  String get alertPreferences => 'تفضيلات التنبيهات';

  @override
  String get immediateNotifications => 'تنبيهات فورية';

  @override
  String get signOut => 'تسجيل الخروج';

  @override
  String get signOutConfirmation => 'هل أنت متأكد أنك تريد تسجيل الخروج؟';

  @override
  String get preferences => 'التفضيلات';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get immediateThreatAlerts => 'تنبيهات فورية للتهديدات';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get lightMode => 'الوضع الفاتح';

  @override
  String get oledOptimizedInterface => 'واجهة محسنة لشاشات OLED';

  @override
  String get language => 'اللغة';

  @override
  String get englishUs => 'الإنجليزية (US)';

  @override
  String get arabic => 'العربية';

  @override
  String get resources => 'المصادر';

  @override
  String get helpCenter => 'مركز المساعدة';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get security => 'الأمان';

  @override
  String get realTimeProtection => 'الحماية الفورية';

  @override
  String get scanningIncomingLinks => 'فحص جميع الروابط الواردة';

  @override
  String get deepInspection => 'الفحص العميق';

  @override
  String get extendedSandboxAnalysis => 'تحليل متقدم داخل بيئة آمنة';

  @override
  String get smsFiltering => 'تصفية الرسائل النصية';

  @override
  String get blockMaliciousMessages => 'حظر الرسائل الضارة';

  @override
  String get english => 'الإنجليزية';

  @override
  String get authentication => 'المصادقة';
}
