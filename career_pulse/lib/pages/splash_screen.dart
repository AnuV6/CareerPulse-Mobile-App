import 'package:flutter/material.dart';
import 'package:career_pulse/stuf/colors.dart';
import 'package:career_pulse/pages/login_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
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
            const Text(
              'CareerPulse',
              style: TextStyle(
                fontSize: 40,
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Unlock Your Future',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.secondaryColor,
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
