import 'package:flutter/material.dart';
import 'package:career_pulse/stuffs/colors.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Forgot Password?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'To reset your password, you need your email or mobile number that can be authenticated',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 30),
              Image.asset(
                'assets/fpw.png', 
                height: 150,
              ),
              const SizedBox(height: 24),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'xxx@gmail.com',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle reset password
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16), 
                  backgroundColor: AppColors.buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ), // background color
                ),
                child: const Text('RESET PASSWORD', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to login
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.buttonColor2,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ), // text color
                ),
                child: const Text('BACK TO LOGIN',
                 style: TextStyle(color: AppColors.headingColor,
                 fontWeight:FontWeight.w900)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
