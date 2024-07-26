import 'package:flutter/material.dart';

class ExistingSkillsPage extends StatelessWidget {
  const ExistingSkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Existing Skills"),
      ),
      body: const Center(
        child: Text(
          "Existing Skills Page",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
