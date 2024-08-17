import 'package:career_pulse/widgets/AppBarWithBackButton.dart';
import 'package:flutter/material.dart';
import 'package:career_pulse/widgets/common_blue_button.dart';

class InterestedAreaScreen extends StatefulWidget {
  const InterestedAreaScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InterestedAreaScreenState createState() => _InterestedAreaScreenState();
}

class _InterestedAreaScreenState extends State<InterestedAreaScreen> {
  final List<String> _selectedInterests = ['Web Developer', 'Mobile App Developer'];
  final TextEditingController _controller = TextEditingController();

  // List of suggestions for Autocomplete
  final List<String> _allSuggestions = [
    'Web Developer',
    'Mobile App Developer',
    'UI/UX Designer',
    'Data Scientist',
    'Backend Developer',
    'Frontend Developer',
    'Full Stack Developer',
    'Software Engineer',
    'DevOps Engineer',
    'Cloud Engineer',
    'Cyber Security Analyst',
    'Network Engineer',
    'Machine Learning Engineer',
    'Artificial Intelligence Engineer',
    'Game Developer',
    'Embedded Systems Engineer',
    'Robotics Engineer',
    'Blockchain Developer',
    'Digital Marketing Specialist',
    'Content Writer',
    'Graphic Designer',
    'Video Editor',
    'Photographer',
    '3D Artist',
    'Animator',
    'Music Producer',
    'Sound Engineer',
    'VFX Artist',
    'Fashion Designer',
    'Interior Designer',
    'Architect',
    'Civil Engineer',
    'Mechanical Engineer',
    'Electrical Engineer',
    'Chemical Engineer',
    'Aerospace Engineer',
    'Automobile Engineer',
    'Biomedical Engineer',
    'Environmental Engineer',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Select your Interested',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select the fields in which you want internship.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text('You can choose one or more.',
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 16),
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return _allSuggestions.where((String option) {
                  return option.toLowerCase().contains(textEditingValue.text.toLowerCase()) &&
                         !_selectedInterests.contains(option);
                }
                );
              },
                onSelected: (String selection) {
                setState(() {
                  if (!_selectedInterests.contains(selection)) {
                  _selectedInterests.add(selection);
                  }
                });
                _controller.clear();
                },
              fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                return TextField(
                  controller: fieldTextEditingController,
                  focusNode: fieldFocusNode,
                  decoration: InputDecoration(
                    hintText: 'UI/UX designer',
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
                text: 'Next', //put your text
                onPressed: () {
                  // action here
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

