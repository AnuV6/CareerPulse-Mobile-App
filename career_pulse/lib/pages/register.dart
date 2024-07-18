import 'package:flutter/material.dart';
import 'package:career_pulse/stuffs/colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key}); // Corrected constructor syntax

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
              'Create Account',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 32),

            // Full Name
            const Text(
              'Full name',
              style: TextStyle(color: AppColors.headingColor),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Ezio Auditore',
                labelStyle: TextStyle(color: AppColors.headingColor),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Email
            const Text(
              'Email',
              style: TextStyle(color: AppColors.headingColor),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'ezio@email.com',
                labelStyle: TextStyle(color: AppColors.headingColor),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            // Password
            const Text(
              'Password',
              style: TextStyle(color: AppColors.headingColor),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: '**********',
                labelStyle: TextStyle(color: AppColors.headingColor),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.visibility_off),
              ),
              obscureText: true,
            ),

            // Remember me button and Forget password
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

            // Sign Up button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Center(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Sign in with Google button
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

            // Sign In button
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: RichText(
                  text: const TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(color: Color.fromARGB(255, 40, 20, 121)),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
