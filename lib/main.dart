import 'package:catch_a_phish/Core/utils/app_routes.dart';
import 'package:catch_a_phish/Core/utils/app_theme.dart';
import 'package:catch_a_phish/Core/utils/notification_service.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/message_scan/message_scan_screen.dart';
import 'package:catch_a_phish/Ui/home/tabs/home_tab/widgets/url_scan/url_scan_screen.dart';
import 'package:catch_a_phish/firebase_options.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:catch_a_phish/Ui/auth/auth_screen.dart';
import 'package:catch_a_phish/Ui/home/home_screen.dart';
import 'package:catch_a_phish/providers/app_locale_provider.dart';
import 'package:catch_a_phish/providers/app_theme_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.enableNetwork();
  await NotificationService.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppThemeProvider(),),
      ChangeNotifierProvider(create: (context) => AppLocaleProvider()),
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppThemeProvider appThemeProvider = Provider.of<AppThemeProvider>(context);
    AppLocaleProvider appLocaleProvider  = Provider.of<AppLocaleProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute:FirebaseAuth.instance.currentUser == null
          ? AppRoutes.login
          : AppRoutes.home,
      routes: {
        AppRoutes.login: (context) => const AuthScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.messageScan: (context) => MessageScanScreen(),
        AppRoutes.urlScan: (context) => UrlScanScreen(),
      },
      themeMode: appThemeProvider.appTheme,
      theme: AppTheme.lightTheme,
      darkTheme:AppTheme.darkTheme ,
      locale: Locale(appLocaleProvider.appLanguage),
    );
  }
}