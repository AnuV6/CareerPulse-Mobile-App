import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:career_pulse/widgets/internship_card.dart';
import 'package:career_pulse/saved_internships_state.dart';

class SavedInternshipsPage extends StatelessWidget {
  const SavedInternshipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Internships'),
      ),
      body: Consumer<SavedInternshipsState>(
        builder: (context, savedInternshipsState, child) {
          return ListView.builder(
            itemCount: savedInternshipsState.savedInternships.length,
            itemBuilder: (context, index) {
              final internship = savedInternshipsState.savedInternships[index];
              return InternshipCard(
                title: internship['title']!,
                company: internship['company']!,
                role: internship['role']!,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/internshipDetails',
                    arguments: internship,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
