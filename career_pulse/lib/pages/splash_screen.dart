import 'package:flutter/material.dart';
import 'package:career_pulse/stuffs/colors.dart';
import 'package:career_pulse/pages/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
      MaterialPageRoute(builder: (context) => const LoginScreen()),
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
            Image.asset(
              'assets/logo.png',
              height: 150,
            ),
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Career',
                    style: TextStyle(
                      fontSize: 40,
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w200, // Extra Light
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  TextSpan(
                    text: 'Pulse',
                    style: TextStyle(
                      fontSize: 40,
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Unlock Your Future',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.secondaryColor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w200,
              ),
            ),
            const SizedBox(height: 50),
            const CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(AppColors.secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
