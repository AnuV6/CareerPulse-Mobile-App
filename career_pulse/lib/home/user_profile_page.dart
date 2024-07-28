import 'package:flutter/material.dart';
import 'package:career_pulse/widgets/user_profile_button.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart';
import 'package:career_pulse/stuffs/colors.dart';

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
                // Define the action when button is pressed
              },
            ),
            UserProfileButton(
              iconPath: 'assets/upload_icon.png', 
              text: 'ReUpload Your Resume',
              onPressed: () {
                // Define the action when button is pressed
              },
            ),
            UserProfileButton(
              iconPath: 'assets/linkedin_icon.png', 
              text: 'Connect with LinkedIn',
              onPressed: () {
                // Define the action when button is pressed
              },
            ),
            UserProfileButton(
              iconPath: 'assets/saved_icon.png', 
              text: 'Saved Internships',
              onPressed: () {
                // Define the action when button is pressed
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
