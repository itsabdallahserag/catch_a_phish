import 'package:catch_a_phish/core/utils/app_routes.dart';
import 'package:catch_a_phish/l10n/app_localizations.dart';
import 'package:catch_a_phish/ui/auth/auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
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
      },
    );
  }
}