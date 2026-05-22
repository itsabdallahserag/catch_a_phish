import 'package:catch_a_phish/ui/auth/rusablewidget/container_login_or_signup.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget{
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(            // Background image for the entire screen
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/primarybackground.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: height * 0.1),
            Image.asset('assets/images/splash.png',fit: BoxFit.cover, width: width * 1, height: height * 0.2),
            SizedBox(height: height * 0.02),
            ContainerLoginOrSignUp()
          ]
          ),
      )
        );
  }
}