import 'package:catch_a_phish/Core/utils/app_routes.dart';
import 'package:catch_a_phish/firebase_options.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:catch_a_phish/Ui/auth/auth_screen.dart';
import 'package:catch_a_phish/Ui/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => const AuthScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
      },
    );
  }
}