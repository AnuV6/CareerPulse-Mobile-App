import 'package:career_pulse/widgets/AppBarWithBackButton.dart';
import 'package:career_pulse/widgets/common_blue_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:career_pulse/home/user_profile_page.dart'; 

class InterestedAreaScreen1 extends StatefulWidget {
  const InterestedAreaScreen1({super.key});

  @override
  _InterestedAreaScreen1State createState() => _InterestedAreaScreen1State();
}

class _InterestedAreaScreen1State extends State<InterestedAreaScreen1> {
  final List<String> _selectedInterests = [];
  final TextEditingController _controller = TextEditingController();

  // List of suggestions for Autocomplete (sorted alphabetically)
  final List<String> _allSuggestions = [
    '3D Artist',
    'AI Ethics Researcher',
    'Aerospace Engineer',
    'Animator',
    'Architect',
    'Automobile Engineer',
    'Backend Developer',
    'Bioinformatics Scientist',
    'Blockchain Developer',
    'Business Analyst',
    'Chemical Engineer',
    'Civil Engineer',
    'Cloud Engineer',
    'Cloud Solutions Architect',
    'Content Writer',
    'Customer Success Manager',
    'Cyber Security Analyst',
    'Data Scientist',
    'Database Administrator',
    'DevOps Engineer',
    'Digital Marketing Specialist',
    'E-commerce Specialist',
    'Educational Technology Specialist',
    'Electrical Engineer',
    'Embedded Systems Engineer',
    'Environmental Engineer',
    'Fashion Designer',
    'Financial Analyst',
    'Frontend Developer',
    'Full Stack Developer',
    'Game Developer',
    'Graphic Designer',
    'Hardware Engineer',
    'IT Security Consultant',
    'IT Support Specialist',
    'Interior Designer',
    'Logistics Coordinator',
    'Machine Learning Engineer',
    'Marketing Analyst',
    'Mechanical Engineer',
    'Mobile App Developer',
    'Music Producer',
    'Network Engineer',
    'Operations Manager',
    'Photographer',
    'Product Manager',
    'Project Manager',
    'Quantum Computing Researcher',
    'SEO Specialist',
    'Salesforce Developer',
    'Software Engineer',
    'Sound Engineer',
    'Supply Chain Analyst',
    'Systems Analyst',
    'Technical Writer',
    'UI/UX Designer',
    'VFX Artist',
    'VR/AR Developer',
    'Video Editor',
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
      final DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      final List<String>? interests =
          (userDoc['interestedAreas'] as List<dynamic>?)?.cast<String>();
      
      setState(() {
        _selectedInterests.addAll(interests ?? []);
      });
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
                final inputText = textEditingValue.text.trim();

                // Filter and return suggestions that match the input
                return _allSuggestions.where((String option) {
                  return option.toLowerCase().contains(inputText.toLowerCase()) &&
                      !_selectedInterests.contains(option);
                });
              },
              onSelected: (String selection) {
                setState(() {
                  if (!_selectedInterests.contains(selection)) {
                    _selectedInterests.add(selection);
                  }
                });
                _controller.clear();
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
                    setState(() {
                      if (value.isNotEmpty && !_selectedInterests.contains(value)) {
                        _selectedInterests.add(value);
                      }
                      fieldTextEditingController.clear();
                    });
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
                  deleteIconColor: const Color.fromARGB(255, 105, 51, 34),
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
                text: 'Save',  // Updated button text to "Save"
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
    try {
      // Get the current user
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Update selected interests in Firestore under the current user's document
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({'interestedAreas': _selectedInterests});

        // Navigate back to UserProfilePage
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const UserProfilePage(),
            ),
          );
        }
      } else {
        // Handle the case where there is no authenticated user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: No authenticated user.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update interests: $e")),
      );
    }
  }
}
