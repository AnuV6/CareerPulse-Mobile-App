import 'package:flutter/material.dart';

import 'package:career_pulse/widgets/AppBarWithBackButton.dart'; // Import CustomAppBar
import 'package:career_pulse/widgets/internship_card.dart'; // Import CustomAppBar

class InternshipsPage extends StatelessWidget {
  const InternshipsPage({super.key});

  final List<Map<String, String>> internships = const [
    {
      'companyLogo': 'assets/ilogo4.png',
      'title': 'Software Engineering',
      'company': 'Vertusa Software Solution',
      'role': 'Web Developer'
    },
    {
      'companyLogo': 'assets/ilogo2.png',
      'title': 'Software Engineering',
      'company': '99X Software Solutions',
      'role': 'Full-Stack Developer'
    },
    {
      'companyLogo': 'assets/ilogo3.png',
      'title': 'NetWork Engineering',
      'company': 'Google',
      'role': 'Network Administrator'
    },
    {
      'companyLogo': 'assets/ilogo4.png',
      'title': 'Audio Engineering',
      'company': 'Vertusa Software Solution',
      'role': 'Broadcast Technician'
    },
    {
      'companyLogo': 'assets/ilogo2.png',
      'title': 'Software Engineering',
      'company': '99X Software Solutions',
      'role': 'UX/UI Designer'
    },
    {
      'companyLogo': 'assets/ilogo3.png',
      'title': 'Software Engineering',
      'company': 'Google',
      'role': 'Front-end Developer'
    },
    {
      'companyLogo': 'assets/ilogo3.png',
      'title': 'Software Engineering',
      'company': 'Google',
      'role': 'UX/UI Designer'
    },
    {
      'companyLogo': 'assets/ilogo4.png',
      'title': 'Network Engineering',
      'company': 'Vertusa Software Solution',
      'role': 'Network Architect'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Internships',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: internships.length,
          itemBuilder: (context, index) {
            final internship = internships[index];
            return InternshipCard(
              title: internship['title']!,
              company: internship['company']!,
              role: internship['role']!,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/internshipDetails',
                  arguments: {
                    'title': internship['title']!,
                    'company': internship['company']!,
                    'role': internship['role']!,
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
