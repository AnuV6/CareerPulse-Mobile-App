import 'package:flutter/material.dart';
import 'package:career_pulse/pages/check_email.dart';
import 'package:career_pulse/stuffs/colors.dart';
import 'package:career_pulse/widgets/common_blue_button.dart';
import 'package:career_pulse/services/authentication.dart';


class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController(); // Added TextEditingController

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SingleChildScrollView(
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
              TextField(
                controller: emailController, // Added controller to TextField
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'xxx@gmail.com',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              CommonButton(
                text: 'RESET PASSWORD',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckEmailScreen(email: emailController.text),
                    ),
                  );
                  AuthService().resetPassword(email: emailController.text);
                },
              ),
              const SizedBox(height: 16),
              
              TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to login
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 181, 204, 239),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    foregroundColor: Colors.black, // Set the font color to black
                  ),
                  child: const Text('BACK TO LOGIN', style: TextStyle(fontWeight: FontWeight.w900)),
                ),
                const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
