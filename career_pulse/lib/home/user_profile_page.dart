import 'package:flutter/material.dart';
import 'package:career_pulse/widgets/user_profile_button.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart';
import 'package:career_pulse/stuffs/colors.dart';
import 'package:career_pulse/home/saved_internships_page.dart'; // Import the SavedInternshipPage
import 'package:career_pulse/pages/interested_area_screen.dart';
import 'package:career_pulse/home/upload_resume_only.dart';
import 'package:career_pulse/home/linkedin_link.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'User Account',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.primaryColor,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/user_image.jpg'), // user image asset
                    radius: 50,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Mamitha Bhaju',
                    style: TextStyle(color: AppColors.textColorinBlue, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'University of Sri Jayewardenepura',
                    style: TextStyle(color: AppColors.textColorinBlue, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      // Define the action when Edit Profile is pressed
                    },
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(color: AppColors.primaryColor, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            UserProfileButton(
              iconPath: 'assets/selection_edit_icon.png', 
              text: 'Edit Your Field Selections',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InterestedAreaScreen()), // Navigate to SavedInternshipPage
                );
              },
            ),
            UserProfileButton(
              iconPath: 'assets/upload_icon.png', 
              text: 'ReUpload Your Resume',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UploadResumeOnlyScreen()), // Navigate to SavedInternshipPage
                );
              },
            ),
            UserProfileButton(
              iconPath: 'assets/linkedin_icon.png', 
              text: 'Connect with LinkedIn',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddLinkedInScreen()), // Navigate to SavedInternshipPage
                );
              },
            ),
            UserProfileButton(
              iconPath: 'assets/saved_icon.png', 
              text: 'Saved Internships',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SavedInternshipsPage()), // Navigate to SavedInternshipPage
                );
              },
            ),
            UserProfileButton(
              iconPath: 'assets/applied_icon.png', 
              text: 'Applied Internships',
              onPressed: () {
                // Define the action when button is pressed
              },
            ),
          ],
        ),
      ),
    );
  }
}
