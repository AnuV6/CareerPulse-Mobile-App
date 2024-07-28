import 'package:flutter/material.dart';
import 'package:career_pulse/stuffs/colors.dart';

class UserProfileButton extends StatelessWidget {
  final String iconPath;
  final String text;
  final VoidCallback onPressed;

  const UserProfileButton({
    super.key,
    required this.iconPath,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,  // Make the button take the full width of its parent
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondaryColor,
            side: const BorderSide(color: Colors.transparent),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            elevation: 2.0,
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 22.0),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.max,  // Ensure the row takes up the full width of the button
            mainAxisAlignment: MainAxisAlignment.start,  // Align content to the left
            children: [
              Image.asset(
                iconPath,
                height: 24.0,
                width: 24.0,
                
              ),
              const SizedBox(width: 12.0),  // Add a small gap between the icon and text
              Text(
                text,
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
