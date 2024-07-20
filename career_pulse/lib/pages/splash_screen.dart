import 'package:flutter/material.dart';
import 'package:career_pulse/stuffs/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
