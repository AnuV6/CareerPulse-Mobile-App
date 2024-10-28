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
              score: 85,
              comment: "Very Good!",
            ),
            const SizedBox(height: 16),
            _buildSectionHeader('Overview'),
            const Text(
              'John Doe is a highly skilled software developer with over 7 years of experience in the technology industry. His resume highlights a strong background in both backend and frontend development, with a particular focus on web and mobile applications. John has demonstrated a consistent ability to deliver high-quality software solutions, evidenced by his professional history and technical accomplishments.',
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
              '• Languages: Proficient in Java, Python, JavaScript, and C#.\n• Frameworks and Libraries: Extensive experience with Angular, React, Node.js, and Spring Boot.\n• Tools and Platforms: Skilled in using Git, Docker, Jenkins, and AWS for CI/CD and cloud deployment.\n• Databases: Proficient in both SQL (MySQL, PostgreSQL) and NoSQL (MongoDB, Cassandra) databases.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            _buildSubSectionHeader('2. Professional Experience'),
            const Text(
              '• Senior Software Developer at XYZ Tech (2018 - Present):\n   - Led the development of a scalable e-commerce platform that increased client sales by 25%.\n   - Implemented microservices architecture, improving system maintainability and performance.\n   - Mentored junior developers, enhancing the team\'s overall productivity and skillset.\n• Software Engineer at ABC Solutions (2015 - 2018):\n   - Developed a mobile application for a major healthcare provider, improving patient engagement by 30%.\n   - Collaborated with cross-functional teams to deliver software projects on time and within budget.',
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
