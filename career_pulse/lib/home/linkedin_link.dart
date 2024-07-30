// only adding linkedin account in the user account page

import 'package:flutter/material.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart';

class AddLinkedInScreen extends StatefulWidget {
  const AddLinkedInScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddLinkedInScreenState createState() => _AddLinkedInScreenState();
}

class _AddLinkedInScreenState extends State<AddLinkedInScreen> {
  final TextEditingController _linkedinController = TextEditingController();

  void _submit() {
    final linkedinUrl = _linkedinController.text.trim();
    if (linkedinUrl.isEmpty || !Uri.parse(linkedinUrl).isAbsolute) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid LinkedIn profile link')),
      );
      return;
    }

    // Handle the LinkedIn URL submission logic here

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('LinkedIn profile submitted successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: const CustomAppBar(
        title: 'Add LinkedIn Profile',
      ), // Custom app bar with a back button
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Upload Your LinkedIn Profile Link',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Add your LinkedIn profile link here. *This is required.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _linkedinController,
                decoration: const InputDecoration(
                  labelText: 'LinkedIn Profile Link',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color(0xFF1954EE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
