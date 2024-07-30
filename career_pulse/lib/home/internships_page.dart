import 'package:flutter/material.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart'; // Import CustomAppBar

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
      'role': 'Fron-end Developer'
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
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(internship['companyLogo']!),
                  ),
                  title: Text(internship['title']!),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(internship['company']!),
                      Text(internship['role']!),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.bookmark_border),
                    onPressed: () {},
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
