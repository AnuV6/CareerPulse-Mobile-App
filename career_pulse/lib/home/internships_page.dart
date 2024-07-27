// internships_page.dart
import 'package:flutter/material.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart'; // Import CustomAppBar

class InternshipsPage extends StatelessWidget {
  const InternshipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Internships',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: const Center(
        child: Text('This is the Internships page.'),
      ),
    );
  }
}
