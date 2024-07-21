//import 'package:career_pulse/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:career_pulse/stuffs/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
               // Increased space here to push everything downward
              const SizedBox(height: 50), // Add some padding at the top
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              const Text(
                'Sign up to get started!',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(
                  height: 32), // Maintain space between title and first input

              // Full Name
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  hintText: "John Doe",
                  labelStyle: TextStyle(color: AppColors.headingColor),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Email
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: "contact@careerpuls.com",
                  labelStyle: TextStyle(color: AppColors.headingColor),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Password
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: '**********',
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
              const SizedBox(height: 32),

              // Sign Up button
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
                        'SIGN UP WITH GOOGLE',
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
              const SizedBox(
                height: 50,
                child: Text(
                  '',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
              const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      );
  }
}
