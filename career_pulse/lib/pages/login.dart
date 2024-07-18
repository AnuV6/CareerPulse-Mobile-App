import 'package:flutter/material.dart';
import 'package:career_pulse/stuffs/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We\'re glad to have you here again.',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 32),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: AppColors.headingColor),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: AppColors.headingColor),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.visibility_off),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (bool? value) {},
                    ),
                    const Text(
                      'Remember me',
                      style: TextStyle(color: AppColors.headingColor),
                    ),
                  ],
                ),
                TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/forgotPassword');
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Center(
                child: Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonColor2,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/google.png', 
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'SIGN IN WITH GOOGLE',
                      style: TextStyle(color: AppColors.headingColor),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: TextButton(
              onPressed: () {
                  Navigator.pushNamed(context, '/register');
              },
                child: const Text('You don\'t have an account yet? Sign up',
                style: TextStyle(color: AppColors.headingColor),
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
