import 'package:flutter/material.dart';
import 'package:career_pulse/stuffs/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:career_pulse/pages/almost_done_splash.dart'; 

class PleaseWaitAnalyzingSplash extends StatefulWidget {
  const PleaseWaitAnalyzingSplash({super.key});

  @override
  _PleaseWaitAnalyzingSplashState createState() => _PleaseWaitAnalyzingSplashState();
}

class _PleaseWaitAnalyzingSplashState extends State<PleaseWaitAnalyzingSplash> {
  @override
  void initState() {
    super.initState();
    // delay seconds
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AlmostDoneScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            const Text(
              'Please wait while we are analyzing your data.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Image.asset(
                'assets/pleaseWaitWhileAnalyze.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 40),
            LoadingAnimationWidget.halfTriangleDot(
              color: AppColors.primaryColor,
              size: 60,
            ),
            const SizedBox(height: 40),
            const Text(
              'Analyzing...',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.primaryColor,
              ),
            ),
            const Spacer(),
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
