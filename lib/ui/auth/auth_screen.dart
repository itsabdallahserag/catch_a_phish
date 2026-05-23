import 'package:catch_a_phish/core/utils/app_images.dart';
import 'package:catch_a_phish/ui/auth/rusable_widget/container_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: Container(
            width: double.infinity,
            height: double.infinity, // Background image for the entire screen
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.primaryBackground),
                fit: BoxFit.fill
                ,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: height * 0.05),
                  Image.asset(
                    AppImages.splash,
                    fit: BoxFit.cover,
                    width: width * 1,
                    height: height * 0.2,
                  ),
                  ContainerAuth(),
                ],
              ),
            ),
          ),
    );
  }
}
