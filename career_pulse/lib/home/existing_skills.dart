// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:career_pulse/widgets/course_card.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  final List<Map<String, String>> courses = const [
    {
      'courseTitle': 'Front-End Developer Professional Certificate',
      'company': 'Coursera',
    },
    {
      'courseTitle': 'Foundations of User Experience (UX) Design',
      'company': 'Google',
    },
    {
      'courseTitle': 'Project Management Professional Certificate',
      'company': 'Coursera',
    },
    {
      'courseTitle': 'web development',
      'company': 'Udemy',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Skill Gaps'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return CourseCard(
              courseTitle: course['courseTitle']!,
              company: course['company']!,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/courseDetails',
                  arguments: {
                    'courseTitle': course['courseTitle']!,
                    'company': course['company']!,
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
