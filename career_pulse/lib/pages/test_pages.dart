import 'package:flutter/material.dart';

class TestPagesScreen extends StatelessWidget {
  const TestPagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Pages'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/almostDone');
              },
              child: const Text('Test Almost Done Page'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/aboutUs');
              },
              child: const Text('About Us'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/interestedArea');
              },
              child: const Text('Interested Area'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/uploadResume');
              },
              child: const Text('Upload Resume'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/homePage');
              },
              child: const Text('Test Home Page'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/password');
              },
              child: const Text(
                  'Password Page'), // Button to test the Password screen
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pleaseWaitAnalyzing');
              },
              child: const Text(
                  'Please Wait Analyzing Page'), // Button to test the screen
            ),
          ],
        ),
      ),
    );
  }
}