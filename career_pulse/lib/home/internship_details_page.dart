import 'package:flutter/material.dart';

class InternshipDetailsPage extends StatelessWidget {
  final String title;
  final String company;
  final String role;

  const InternshipDetailsPage({
    super.key,
    required this.title,
    required this.company,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    // Simulating AI-generated content
    final aiGeneratedDetails = generateAIDetails(title, company, role);

    return Scaffold(
      appBar: AppBar(
        title: Text('$title Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title at $company',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Role: $role',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              aiGeneratedDetails,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // Function to simulate AI-generated details
  String generateAIDetails(String title, String company, String role) {
    return 'As a $title at $company, you will be responsible for $role. This role requires strong skills in software development, problem-solving, and teamwork. You will work closely with other developers and stakeholders to create high-quality software solutions.';
  }
}
