import 'package:flutter/material.dart';

class NewSkillsPage extends StatelessWidget {
  const NewSkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Skills"),
      ),
      body: const Center(
        child: Text(
          "New Skills Page",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
