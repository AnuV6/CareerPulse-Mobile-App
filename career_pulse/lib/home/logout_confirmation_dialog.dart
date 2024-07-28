import 'package:flutter/material.dart';

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
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    // Handle the "Yes" action
                    Navigator.of(context).pop(); // Close the dialog
                    // Add your logout logic here
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
