// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:career_pulse/widgets/ThreeDotLoader.dart'; // Ensure this path is correct

class PleaseWaitAnalyzingSplash extends StatelessWidget {
  const PleaseWaitAnalyzingSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60), // Space at the top
            const Text(
              'Please wait while we are analyzing your data.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 40), // Space between text and image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Image.asset(
                'assets/pleaseWaitWhileAnalyze.png', // Use correct asset path
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 40), // Space between image and loader
            const ThreeDotLoader(
                color: Colors.blue), // Using custom three-dot loader
            const SizedBox(height: 40), // Space at the bottom before footer
            const Text(
              'Analyzing...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
            const Spacer(), // Pushes everything up
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'CareerPulse',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
