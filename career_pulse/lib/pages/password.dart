// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart'; // Ensure this import is correct
import 'package:career_pulse/widgets/BottomNavigationBar.dart'; // Ensure this import is correct

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscureOldPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  int _selectedIndex =
      0; // Assuming password screen has index 0 for bottom navigation

  void _toggleOldPasswordVisibility() =>
      setState(() => _obscureOldPassword = !_obscureOldPassword);
  void _toggleNewPasswordVisibility() =>
      setState(() => _obscureNewPassword = !_obscureNewPassword);
  void _toggleConfirmPasswordVisibility() =>
      setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Password'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Update Password',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildPasswordField(
              'Old Password',
              _oldPasswordController,
              _obscureOldPassword,
              _toggleOldPasswordVisibility,
            ),
            const SizedBox(height: 20),
            _buildPasswordField(
              'New Password',
              _newPasswordController,
              _obscureNewPassword,
              _toggleNewPasswordVisibility,
            ),
            const SizedBox(height: 20),
            _buildPasswordField(
              'Confirm Password',
              _confirmPasswordController,
              _obscureConfirmPassword,
              _toggleConfirmPasswordVisibility,
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle password update logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                ),
                child: const Text(
                  'UPDATE',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller,
      bool obscureText, VoidCallback toggleVisibility) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: toggleVisibility,
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
