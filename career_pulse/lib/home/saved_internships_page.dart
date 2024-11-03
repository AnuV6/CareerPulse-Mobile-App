import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:career_pulse/widgets/internship_card.dart';
import 'package:career_pulse/saved_internships_state.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart';
import 'package:career_pulse/widgets/job_popup.dart';

class SavedInternshipsPage extends StatelessWidget {
  const SavedInternshipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Saved Internships',
      ),
      body: Consumer<SavedInternshipsState>(
        builder: (context, savedInternshipsState, child) {
          // Check if there are any saved internships
          if (savedInternshipsState.savedInternships.isEmpty) {
            return const Center(
              child: Text(
                'No saved internships',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          // Build the list of saved internships
          return ListView.builder(
            itemCount: savedInternshipsState.savedInternships.length,
            itemBuilder: (context, index) {
              final internship = savedInternshipsState.savedInternships[index];

              // Ensure all keys are present in the map
              final title = internship['title'] ?? 'Title Not Available';
              final company = internship['company'] ?? 'Company Not Available';
              final role = internship['role'] ?? 'Role Not Available';
              final location =
                  internship['location'] ?? 'Location Not Available';
              final datePosted =
                  internship['datePosted'] ?? 'Date Not Available';
              final daysAgo = internship['daysAgo'] ?? 'Date Not Available';
              final jobUrl = internship['jobUrl'] ??
                  ''; // Get the job URL or empty string if null

              return InternshipCard(
                title: title,
                company: company,
                role: role,
                location: location,
                datePosted: datePosted,
                daysAgo: daysAgo,
                jobUrl: jobUrl, // Pass the correct job URL here
                onTap: () {
                  // Show the JobPopup when tapped
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return JobPopup(
                        companyName: company,
                        roleTitle: role,
                        location: location,
                        datePosted: datePosted,
                        daysAgo: daysAgo,
                        jobUrl: jobUrl, // Pass the job URL here
                      );
                    },
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
