import 'package:flutter/material.dart';

class CheckEmailScreen extends StatelessWidget {
  final String email;

  const CheckEmailScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Check Your Email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1954EE),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'We have sent the reset password to the email address\n$email',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 53, 100, 170),
                ),
              ),
              const SizedBox(height: 24),
              Image.asset(
                'assets/check_email.png', // Update this asset
                height: 150,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Handle open email
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color(0xFF1954EE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: const Text('OPEN YOUR EMAIL', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to login
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black54,
                  backgroundColor: const Color.fromARGB(255, 181, 204, 239),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  side: const BorderSide(color: Colors.black54),
                ),
                child: const Text('BACK TO LOGIN', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w900)),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Handle resend email
                },
                child: const Text(
                  'You have not received the email? Resend',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 53, 100, 170),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
