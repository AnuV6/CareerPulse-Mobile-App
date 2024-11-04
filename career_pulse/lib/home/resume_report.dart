import 'package:flutter/material.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart';
import 'package:career_pulse/widgets/BottomNavigationBar.dart';
import 'package:career_pulse/widgets/score_widget.dart';

class ResumeReportPage extends StatefulWidget {
  const ResumeReportPage({super.key});

  @override
  State<ResumeReportPage> createState() => _ResumeReportPageState();
}

class _ResumeReportPageState extends State<ResumeReportPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Analyzing Report'), // Custom app bar with a back button
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Your Career Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            const ScoreWidget(
              score: 87,
              comment: "Very Good!",
            ),
            const SizedBox(height: 16),
            _buildSectionHeader('Overview'),
            const Text(
              'Nadun Daluwatta is a highly skilled frontend developer with over 5 years of experience in the technology industry. His resume highlights a strong background in both UI and UX development, with a particular focus on web and mobile applications. Nadun has demonstrated a consistent ability to deliver high-quality software solutions, evidenced by his professional history and technical accomplishments.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionHeader('Strengths'),
            const SizedBox(height: 16),
            _buildSubSectionHeader('1. Technical Proficiency'),
            const Text(
              '• Tools: Proficient in Adobe Illustrator, Sketch, and Figma.\n• Languages: Experienced in HTML, CSS, JavaScript, and TypeScript.\n• Frameworks: Skilled in React, Angular, and Vue.js.\n• Libraries: Familiar with Redux, RxJS, and Lodash.\n• Testing: Knowledgeable in Jest, Enzyme, and Cypress.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            _buildSubSectionHeader('2. Professional Experience'),
            const Text(
              '• Frontend Developer at SandzLab (2020-2022)\n• UI/UX Designer at Cybor Graphics (2019-Present)\n• Web Developer at Fiverr (2015-2017)\n• Software Engineer at CareerPulse (2023-2024)',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildSubSectionHeader(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
