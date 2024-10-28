// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart'; // Import CustomAppBar
import 'package:career_pulse/widgets/internship_card.dart'; // Import InternshipCard
import 'package:career_pulse/widgets/job_popup.dart'; // Import JobPopup
import '../pages/job_search.dart'; // Import the job_search

class InternshipsPage extends StatefulWidget {
  const InternshipsPage({super.key});

  @override
  _InternshipsPageState createState() => _InternshipsPageState();
}

class _InternshipsPageState extends State<InternshipsPage> {
  List<Map<String, dynamic>> internships = [];
  final JobSearchService jobSearchService = JobSearchService();
  bool isLoading = false; // To manage loading state during refresh

  @override
  void initState() {
    super.initState();
    fetchInternships();
  }

  Future<void> fetchInternships() async {
    setState(() {
      isLoading = true; // Show loading indicator
    });

    try {
      final fetchedInternships = await jobSearchService.fetchJobs();
      print('Internships fetched: $fetchedInternships');
      setState(() {
        internships = fetchedInternships;
      });
    } catch (e) {
      // Handle any errors here
      print('Error fetching internships: $e');
    } finally {
      setState(() {
        isLoading = false; // Hide loading indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Internships',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: RefreshIndicator(
        onRefresh: fetchInternships, // Re-fetch internships on pull down
        child: isLoading && internships.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: internships.length,
                  itemBuilder: (context, index) {
                    final internship = internships[index];
                    return InternshipCard(
                      title: internship['title']!, // Job position title
                      company: internship['company']!, // Company name
                      role: internship['role']!, // Role, if applicable
                      location: internship['location']!, // Location
                      datePosted: internship['date']!, // Posting date
                      daysAgo: internship['daysAgo']!, // Days ago posted
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
      ),
    );
  }
}
