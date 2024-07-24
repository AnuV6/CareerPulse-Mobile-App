import 'package:flutter/material.dart';
import 'package:career_pulse/services/authentication.dart';
import 'package:career_pulse/stuffs/colors.dart';
import 'package:career_pulse/widgets/common_blue_button.dart';
import 'package:career_pulse/widgets/google_signin_button.dart';

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
              const SizedBox(height: 50),
              const Text('Create Account',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor)),
              const Text('Sign up to get started!',
                  style:
                      TextStyle(fontSize: 16, color: AppColors.primaryColor)),
              const SizedBox(height: 32),
              const TextField(
                  decoration: InputDecoration(
                      labelText: 'Full Name',
                      hintText: "John Doe",
                      labelStyle: TextStyle(color: AppColors.headingColor),
                      border: OutlineInputBorder())),
              const SizedBox(height: 16),
              const TextField(
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: "example@email.com",
                      labelStyle: TextStyle(color: AppColors.headingColor),
                      border: OutlineInputBorder())),
              const SizedBox(height: 16),
              TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: '**********',
                      labelStyle:
                          const TextStyle(color: AppColors.headingColor),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.headingColor),
                          onPressed: _togglePasswordVisibility)),
                  obscureText: _obscureText),
              const SizedBox(height: 32),
              CommonButton(
                  text: 'Sign Up',
                  onPressed: () {
                    AuthService().signup(
                        email: _emailController.text,
                        password: _passwordController.text,
                        context: context);
                  }),
              const SizedBox(height: 16),
              GoogleSignInButton(onPressed: () {}),
              const SizedBox(height: 32),
              Center(
                  child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: RichText(
                    text: const TextSpan(
                        text: 'Already have an account? ',
                        style:
                            TextStyle(color: Color.fromARGB(255, 40, 20, 121)),
                        children: <TextSpan>[
                      TextSpan(
                          text: 'Sign In',
                          style: TextStyle(color: AppColors.primaryColor))
                    ])),
              )),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/almostDone'); // Navigate to AlmostDoneScreen
                },
                child: const Text(
                  'Test Almost Done Page',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/aboutUs'); // Navigate to AlmostDoneScreen
                },
                child: const Text(
                  'About us',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
