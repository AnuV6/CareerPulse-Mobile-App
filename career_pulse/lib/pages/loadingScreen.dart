// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:career_pulse/stuffs/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart'; //loading animation widget

class loadingScreen extends StatefulWidget {
  const loadingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<loadingScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => const loadingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'CareerPulse',
                    style: TextStyle(
                      fontSize: 40,
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w200, // Extra Light
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            LoadingAnimationWidget.staggeredDotsWave(
              // add loading animation
              color: AppColors.textColorinBlue,
              size: 70,
            ),
          ],
        ),
      ),
    );
  }
}
