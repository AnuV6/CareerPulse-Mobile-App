// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for system UI overlay style adjustments

class InternshipDetailsPage extends StatelessWidget {
  final String title;
  final String company;
  final String role;

  const InternshipDetailsPage({
    super.key,
    required this.title,
    required this.company,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: TextStyle(fontWeight: FontWeight.bold), // Make text bold
        ),
        centerTitle: true, // Center the title within the AppBar
        backgroundColor: Colors.white, // Set background color to white
        foregroundColor: Colors.black, // Set text and icon color to black
        elevation: 1, // Optional: reduces shadow under the AppBar
        systemOverlayStyle:
            SystemUiOverlayStyle.dark, // Ensures status bar icons are dark
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context)
              .pop(), // Ensures the back button pops the current screen
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CircleAvatar(
              radius: 30.0,
              backgroundColor:
                  Colors.blueGrey[100], // Placeholder color for demo logo
              child: Text('Logo'), // Placeholder for actual logo
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.lightBlue[100], // Sky blue color background
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 45, 44, 114)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "$company | $role",
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 45, 44, 114)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              generateAIDetails(title, company, role),
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 45, 44, 114),
                  backgroundColor:
                      Color.fromARGB(255, 161, 186, 206), // Text color
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20.0), // Rounded corners
                  ),
                ),
                onPressed: () {
                  // Implement Read More action
                },
                child: Text('Read more'),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Requirements',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            // Remaining space for additional details or widgets
            Expanded(
              // This will take all available space
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  // Function to simulate AI-generated details
  String generateAIDetails(String title, String company, String role) {
    return 'As a $title at $company, you will be responsible for $role. This role requires strong skills in frontend development, problem-solving, and teamwork. You will work closely with other developers and stakeholders to create high-quality software solutions.';
  }
}

void main() => runApp(MaterialApp(
        home: InternshipDetailsPage(
      title: 'Frontend Developer Internship',
      company: 'Tech Solutions',
      role: 'Frontend Development',
    )));
