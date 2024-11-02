// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
// Import the services package
import 'package:career_pulse/stuffs/colors.dart';
import 'package:career_pulse/services/authentication.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Log out',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Are you sure you want to leave?',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    // Handle the "Yes" action
                    await AuthService().signout(context: context);

                    // Navigate to login screen after logout
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Text('YES'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text('CANCEL'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
