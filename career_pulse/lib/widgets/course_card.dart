// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String courseTitle;
  final String company;
  final VoidCallback onTap;

  const CourseCard({
    super.key,
    required this.courseTitle,
    required this.company,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 25,
            child: Icon(
              company == 'Meta' ? Icons.school : Icons.design_services,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Text(
            courseTitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 45, 44, 114),
            ),
          ),
          subtitle: Text(
            company,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          trailing: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 179, 199, 216),
              foregroundColor: Color.fromARGB(255, 45, 44, 114),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('View'),
          ),
        ),
      ),
    );
  }
}

class ExistingSkillsPage extends StatelessWidget {
  const ExistingSkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Improve Your New Skills",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold, // Slightly bold the text
          ),
        ),
        centerTitle: true, // Center the title
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Suggestions",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 45, 44, 114),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  CourseCard(
                    courseTitle:
                        'Front-End Developer Professional Certificate',
                    company: 'UdeMy',
                    onTap: () {
                      // Handle view button tap
                    },
                  ),
                  const SizedBox(height: 10),
                  CourseCard(
                    courseTitle: 'Foundations of User Experience (UX) Design',
                    company: 'Coursera',
                    onTap: () {
                      // Handle view button tap
                    },
                  ),
                  const SizedBox(height: 10),
                  CourseCard(
                    courseTitle:
                        'Learn Front-End Web Development with React',
                    company: 'Codecademy',
                    onTap: () {
                      // Handle view button tap
                    },
                  ),
                  const SizedBox(height: 10),
                  CourseCard(
                    courseTitle: 'Photoshop CC 2021 MasterClass',
                    company: 'Adobe',
                    onTap: () {
                      // Handle view button tap
                    },
                  ),
                  const SizedBox(height: 10),
                  CourseCard(
                    courseTitle: 'Google IT Support Professional Certificate',
                    company: 'Google',
                    onTap: () {
                      // Handle view button tap
                    },
                  ),
                  const SizedBox(height: 10),
                  CourseCard(
                    courseTitle:
                        'The Complete Digital Marketing Course - 12 Courses in 1',
                    company: 'Udemy',
                    onTap: () {
                      // Handle view button tap
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: ExistingSkillsPage()));
