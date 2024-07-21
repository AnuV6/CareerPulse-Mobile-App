//import 'package:career_pulse/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:career_pulse/stuffs/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  bool _rememberMe = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleRememberMe(bool? newValue) {
    setState(() {
      _rememberMe = newValue ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50), // Add some padding at the top
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

              // Email
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'careerpulse@gmail.com',
                  labelStyle: TextStyle(color: AppColors.headingColor),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Password
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: '********',
                  labelStyle: const TextStyle(color: AppColors.headingColor),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.headingColor,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                obscureText: _obscureText,
              ),
              const SizedBox(height: 16),

              // Remember me and Forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (bool? value) {
                          _toggleRememberMe(value);
                        },
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

              // Login button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Login with Google button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonColor2,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
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

              // Sign up button
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'You don\'t have an account yet? ',
                      style: TextStyle(color: AppColors.headingColor),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32), // Add some padding at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
