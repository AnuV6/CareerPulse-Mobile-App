import 'package:flutter/material.dart';

class ResumeSuggestionsPage extends StatelessWidget {
  const ResumeSuggestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Suggestions to improve resume"),
      ),
      body: const Center(
        child: Text(
          "Here are some suggestions to improve your resume.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
