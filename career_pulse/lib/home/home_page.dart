import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import 'package:career_pulse/stuffs/colors.dart';
import 'package:career_pulse/widgets/internship_card.dart';
import 'package:career_pulse/home/saved_internships_page.dart';
import 'package:career_pulse/widgets/BottomNavigationBar.dart';
import 'package:career_pulse/home/internships_page.dart';
import 'package:career_pulse/home/user_profile_page.dart';
import 'package:career_pulse/home/settings_page.dart';
import 'package:career_pulse/widgets/job_popup.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  Future<String?> _fetchUserFullName() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        final doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        if (doc.exists) {
          return doc.data()?['fullName'] ?? 'User';
        } else {
          print("Document does not exist.");
          return 'User';
        }
      } catch (e) {
        print("Error fetching full name: $e");
        return 'User';
      }
    }
    return 'User';
  }

  /// Load the profile image path from SharedPreferences
  Future<File?> _getProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image_path');
    if (imagePath != null) {
      final file = File(imagePath);
      if (await file.exists()) {
        return file;
      }
    }
    return null;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      _buildHomePage(context),
      const InternshipsPage(),
      const UserProfilePage(),
      const SettingsPage(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildHomePage(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FutureBuilder<String?>(
                future: _fetchUserFullName(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text(
                      "Loading...",
                      style: TextStyle(
                          fontSize: 22, color: AppColors.primaryColor),
                    );
                  } else if (snapshot.hasError) {
                    return const Text("Error loading name");
                  } else {
                    String fullName = snapshot.data ?? 'User';
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hello",
                          style: TextStyle(
                              fontSize: 22, color: AppColors.primaryColor),
                        ),
                        Text(
                          fullName,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              FutureBuilder<File?>(
                future: _getProfileImage(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircleAvatar(
                      backgroundImage: AssetImage('assets/user_image.png'),
                      radius: 30,
                    );
                  } else if (snapshot.hasData && snapshot.data != null) {
                    return CircleAvatar(
                      backgroundImage: FileImage(snapshot.data!),
                      radius: 30,
                    );
                  } else {
                    return const CircleAvatar(
                      backgroundImage: AssetImage('assets/user_image.png'),
                      radius: 30,
                    );
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Analyzing Report",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Material(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(25),
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () {
                Navigator.pushNamed(context, '/resumeReport');
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/trophy.png',
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Score is 85%.",
                          style: TextStyle(
                              fontSize: 22, color: AppColors.textColorinBlue),
                        ),
                        Text(
                          "Very Good!",
                          style: TextStyle(
                              fontSize: 18, color: AppColors.textColorinBlue),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Material(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(25),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      Navigator.pushNamed(context, '/existingSkills');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/chart.png',
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Find more about Your Skill Gaps",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: AppColors.textColorinBlue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Material(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(25),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      Navigator.pushNamed(context, '/newSkills');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/lightbulb.png',
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "To improve Your New Skills",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: AppColors.textColorinBlue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Material(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(25),
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () {
                Navigator.pushNamed(context, '/resumeSuggestions');
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/thumbs_up.png',
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Suggestions to improve resume",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColorinBlue),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Recommended Internships",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          InternshipCard(
            title: "Software Engineering",
            company: "BeGOOD Solutions",
            role: "Web Developer",
            location: "Colombo, Sri Lanka.",
            datePosted: "2024-08-13",
            daysAgo: "2 days ago",
            jobUrl: "https://example.com/job-link", // Add a valid job URL here
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const JobPopup(
                    companyName: "BeGOOD Solutions",
                    roleTitle: "Web Developer",
                    location: "Colombo, Sri Lanka.",
                    datePosted: "2024-08-13",
                    daysAgo: "2 days ago",
                    jobUrl:
                        "https://example.com/job-link", // Add a valid job URL here
                  );
                },
              );
            },
          ),
          const SizedBox(height: 20),
          Material(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SavedInternshipsPage(),
                  ),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: const Center(
                  child: Text(
                    "View Saved Internships",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColorinBlue),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
