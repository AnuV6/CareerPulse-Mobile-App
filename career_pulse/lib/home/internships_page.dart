import 'package:flutter/material.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart'; // Import CustomAppBar
import 'package:career_pulse/widgets/internship_card.dart'; // Import InternshipCard
import 'package:career_pulse/widgets/job_popup.dart'; // Import JobPopup

class InternshipsPage extends StatelessWidget {
  const InternshipsPage({super.key});

  final List<Map<String, String>> internships = const [
    {
      'companyLogo': 'assets/ilogo4.png',
      'title': 'Software Engineering',
      'company': 'Vertusa Software Solution',
      'role': 'Web Developer',
      'location': 'Colombo, Sri Lanka.',
      'date': '2024-08-13',
      'daysAgo': '2 days ago'
    },
    {
      'companyLogo': 'assets/ilogo2.png',
      'title': 'Software Engineering',
      'company': '99X Software Solutions',
      'role': 'Full-Stack Developer',
      'location': 'Colombo, Sri Lanka.',
      'date': '2024-08-11',
      'daysAgo': '4 days ago'
    },
    // Add other internships here with similar structure
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
              location: internship['location']!, // Pass location
              datePosted: internship['date']!, // Pass datePosted
              daysAgo: internship['daysAgo']!, // Pass daysAgo
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return JobPopup(
                      companyName: internship['company']!,
                      roleTitle: internship['role']!,
                      location: internship['location']!,
                      datePosted: internship['date']!,
                      daysAgo: internship['daysAgo']!,
                    );
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
