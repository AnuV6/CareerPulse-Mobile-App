// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart';
import 'package:career_pulse/widgets/common_blue_button.dart';
import 'package:career_pulse/home/user_profile_page.dart';

class InterestedAreaScreen1 extends StatefulWidget {
  const InterestedAreaScreen1({super.key});

  @override
  _InterestedAreaScreen1State createState() => _InterestedAreaScreen1State();
}

class _InterestedAreaScreen1State extends State<InterestedAreaScreen1> {
  final List<String> _selectedInterests = [];
  final TextEditingController _controller = TextEditingController();

  final List<String> _allSuggestions = [
    // List of all suggestions
    '3D Artist', 'AI Ethics Researcher', 'Aerospace Engineer', 'Animator',
    'Architect',
    'Automobile Engineer', 'Backend Developer', 'Bioinformatics Scientist',
    'Blockchain Developer',
    'Business Analyst', 'Chemical Engineer', 'Civil Engineer', 'Cloud Engineer',
    'Cloud Solutions Architect',
    'Content Writer', 'Customer Success Manager', 'Cyber Security Analyst',
    'Data Scientist',
    'Database Administrator', 'DevOps Engineer', 'Digital Marketing Specialist',
    'E-commerce Specialist',
    'Educational Technology Specialist', 'Electrical Engineer',
    'Embedded Systems Engineer',
    'Environmental Engineer', 'Fashion Designer', 'Financial Analyst',
    'Frontend Developer',
    'Full Stack Developer', 'Game Developer', 'Graphic Designer',
    'Hardware Engineer',
    'IT Security Consultant', 'IT Support Specialist', 'Interior Designer',
    'Logistics Coordinator',
    'Machine Learning Engineer', 'Marketing Analyst', 'Mechanical Engineer',
    'Mobile App Developer',
    'Music Producer', 'Network Engineer', 'Operations Manager', 'Photographer',
    'Product Manager',
    'Project Manager', 'Quantum Computing Researcher', 'SEO Specialist',
    'Salesforce Developer',
    'Software Engineer', 'Sound Engineer', 'Supply Chain Analyst',
    'Systems Analyst', 'Technical Writer',
    'UI/UX Designer', 'VFX Artist', 'VR/AR Developer', 'Video Editor',
    'Web Developer',
    'Quality Assurance Engineer'
  ];

  @override
  void initState() {
    super.initState();
    _loadUserInterests();
  }

  Future<void> _loadUserInterests() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final DocumentSnapshot<Map<String, dynamic>> userDoc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();
      if (userDoc.exists && userDoc.data() != null) {
        final Map<String, dynamic> data = userDoc.data()!;
        final List<String>? interests =
            (data['interestedAreas'] as List?)?.cast<String>();
        setState(() {
          _selectedInterests.addAll(interests ?? []);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Update your Interested Areas',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Update the fields in which you are interested.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'You can choose one or more.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return _allSuggestions.where((option) => option
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase()));
              },
              onSelected: (String selection) {
                setState(() {
                  if (!_selectedInterests.contains(selection)) {
                    _selectedInterests.add(selection);
                  }
                  _controller.clear();
                });
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController fieldTextEditingController,
                  FocusNode fieldFocusNode,
                  VoidCallback onFieldSubmitted) {
                return TextField(
                  controller: fieldTextEditingController,
                  focusNode: fieldFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Enter your interest',
                    prefixIcon: const Icon(Icons.search, color: Colors.blue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onSubmitted: (value) {
                    onFieldSubmitted();
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: _selectedInterests.map((interest) {
                return Chip(
                  label: Text(interest),
                  deleteIconColor: Colors.red,
                  backgroundColor: Colors.blue,
                  labelStyle: const TextStyle(color: Colors.white),
                  onDeleted: () {
                    setState(() {
                      _selectedInterests.remove(interest);
                    });
                  },
                );
              }).toList(),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CommonButton(
                text: 'Save',
                onPressed: () async {
                  await _saveInterestsAndNavigate();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveInterestsAndNavigate() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({'interestedAreas': _selectedInterests});

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const UserProfilePage(),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error: No authenticated user.")));
    }
  }
}
