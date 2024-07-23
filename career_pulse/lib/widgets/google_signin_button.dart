import 'package:flutter/material.dart';
import 'package:career_pulse/stuffs/colors.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleSignInButton({
    required this.onPressed, 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
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
    );
  }
}