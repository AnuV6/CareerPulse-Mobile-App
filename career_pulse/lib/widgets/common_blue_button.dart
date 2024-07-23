// use all blue button in our screens

/* --- ex ----
  CommonButton(
    text: 'Sign In',   //put your text
    onPressed: () {
      // action here
    },
  ),
  const SizedBox(height: 16),
 */ 

import 'package:flutter/material.dart';
import 'package:career_pulse/stuffs/colors.dart';


class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CommonButton({
    required this.text,
    required this.onPressed,
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonColor,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
