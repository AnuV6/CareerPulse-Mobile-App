// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:career_pulse/widgets/course_card.dart';

class CoursesPage_1 extends StatelessWidget {
  const CoursesPage_1({super.key});

  final List<Map<String, String>> courses = const [
    {
      'courseTitle': 'Front-End Developer Professional Certificate',
      'company': 'Meta',
    },
    {
      'courseTitle': 'Foundations of User Experience (UX) Design',
      'company': 'Google',
    },
    {
      'courseTitle': 'Machine Learning Engineer',
      'company': 'Coursera',
    },
    {
      'courseTitle': 'Data Science Professional Certificate',
      'company': 'IBM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
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
