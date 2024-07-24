import 'package:career_pulse/widgets/ThreeDotLoader.dart';
import 'package:flutter/material.dart';

class AlmostDoneScreen extends StatelessWidget {
  const AlmostDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Almost Done!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF196EEE),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Image.asset(
                      'assets/almostdone.png', // Make sure this asset exists
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Now you can access Analyzing Report.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF196EEE),
                    ),
                  ),
                  const SizedBox(height: 40), // Increased space to 40 pixels
                  const ThreeDotLoader(
                      color: Colors.blue), // Using custom three-dot loader
                ],
              ),
            ),
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
