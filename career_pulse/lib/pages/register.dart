import 'package:flutter/material.dart';
import 'package:career_pulse/services/authentication.dart';
import 'package:career_pulse/stuffs/colors.dart';
import 'package:career_pulse/widgets/common_blue_button.dart';
import 'package:career_pulse/widgets/google_signin_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  bool _obscureReenterPassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _reenterPasswordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleReenterPasswordVisibility() {
    setState(() {
      _obscureReenterPassword = !_obscureReenterPassword;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _reenterPasswordController.dispose();
    _fullNameController.dispose();
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
              TextField(
                  controller: _fullNameController,
                  decoration: const InputDecoration(
                      labelText: 'Full Name',
                      hintText: "Anura Kumara",
                      labelStyle: TextStyle(color: AppColors.headingColor),
                      border: OutlineInputBorder())),
              const SizedBox(height: 16),
              TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
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
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.headingColor),
                          onPressed: _togglePasswordVisibility)),
                  obscureText: _obscurePassword),
              const SizedBox(height: 16),
              TextField(
                  controller: _reenterPasswordController,
                  decoration: InputDecoration(
                      labelText: 'Re-enter Password',
                      hintText: '**********',
                      labelStyle: const TextStyle(color: AppColors.headingColor),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          icon: Icon(
                              _obscureReenterPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.headingColor),
                          onPressed: _toggleReenterPasswordVisibility)),
                  obscureText: _obscureReenterPassword),
              const SizedBox(height: 32),
              CommonButton(
                text: 'Sign Up',
                onPressed: () async {
                  if (_passwordController.text != _reenterPasswordController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Passwords do not match")),
                    );
                    return;
                  }
                  // Call the AuthService signup method and navigate to InterestedAreaScreen on success
                  await AuthService().signup(
                    fullname: _fullNameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                    context: context,
                  );
                },
              ),
              const SizedBox(height: 16),
              GoogleSignInButton(
                text: 'Sign Up with Google',
                onPressed: () async {
                  // Use Google sign-up and navigate to InterestedAreaScreen on success
                  await AuthService().signUpWithGoogle(context: context);
                },
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
