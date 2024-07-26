import 'package:flutter/material.dart';

class ResumeReportPage extends StatelessWidget {
  const ResumeReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resume Report"),
      ),
      body: const Center(
        child: Text(
          "Resume Report Page",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
