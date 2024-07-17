import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create an Account'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Placeholder for registration function
                  },
                  child: const Text('Sign Up'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Already have an account? Log in!'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
