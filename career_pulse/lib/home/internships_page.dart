// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart'; // Import CustomAppBar
import 'package:career_pulse/widgets/internship_card.dart'; // Import InternshipCard
import 'package:career_pulse/widgets/job_popup.dart'; // Import JobPopup
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      // Fetch keywords (user's interested areas) from Firestore
      // ignore: unused_local_variable
      List<String> keywords = await _fetchUserInterestedAreas();
      // Fetch internships using the JobSearchService with the keywords
      final fetchedInternships = await jobSearchService.fetchJobs(['software', 'designer']);
      //fetch jobs using the JobSearchService with the manual keywords
      //final fetchedInternships = await jobSearchService.fetchJobs(['internship', 'intern', 'internships']);
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

  Future<List<String>> _fetchUserInterestedAreas() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (snapshot.exists && snapshot.data() != null) {
          Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
          return List<String>.from(data['interestedAreas'] ?? []);
        } else {
          print('No interested areas found for the user.');
          return [];
        }
      } else {
        throw Exception('No authenticated user.');
      }
    } catch (e) {
      print('Failed to fetch user interests: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Internships',
        onBack: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/homePage',
            (route) => false,
          );
        },
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
                      title: internship['title'] ?? 'Unknown Title',
                      company: internship['company'] ?? 'Unknown Company',
                      role: internship['role'] ?? 'Unknown Role',
                      location: internship['location'] ?? 'Unknown Location',
                      datePosted: internship['date'] ?? 'Unknown Date',
                      daysAgo: internship['daysAgo'] ?? 'N/A',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return JobPopup(
                              companyName: internship['company'] ?? 'Unknown Company',
                              roleTitle: internship['role'] ?? 'Unknown Role',
                              location: internship['location'] ?? 'Unknown Location',
                              datePosted: internship['date'] ?? 'Unknown Date',
                              daysAgo: internship['daysAgo'] ?? 'N/A',
                              jobUrl: internship['jobUrl'] ?? 'https://www.linkedin.com/jobs/',
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
