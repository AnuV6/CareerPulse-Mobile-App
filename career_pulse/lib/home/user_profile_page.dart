// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:career_pulse/widgets/user_profile_button.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart';
import 'package:career_pulse/stuffs/colors.dart';
import 'package:career_pulse/home/saved_internships_page.dart';
import 'package:career_pulse/pages/interested_area_screen.dart';
import 'package:career_pulse/home/upload_resume_only.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String userName = 'Mamitha Bhaju';
  String userImagePath = 'assets/user_image.jpg';
  File? _image;

  Future<void> _changeProfilePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  void _changeUserName() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newName = userName;
        return AlertDialog(
          title: const Text('Change Name'),
          content: TextField(
            onChanged: (value) {
              newName = value;
            },
            decoration: const InputDecoration(hintText: "Enter new name"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                setState(() {
                  userName = newName;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'User Account',
        onBack: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
          '/homePage', 
          (route) => false, 
          );
        },
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
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundImage: _image != null
                            ? FileImage(_image!)
                            : AssetImage(userImagePath) as ImageProvider,
                        radius: 50,
                      ),
                      GestureDetector(
                        onTap: _changeProfilePicture,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: AppColors.secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.edit,
                              color: AppColors.primaryColor, size: 20),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          color: AppColors.textColorinBlue,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit,
                            color: AppColors.textColorinBlue),
                        onPressed: _changeUserName,
                      ),
                    ],
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
                  MaterialPageRoute(
                      builder: (context) => const InterestedAreaScreen()),
                );
              },
            ),
            UserProfileButton(
              iconPath: 'assets/upload_icon.png',
              text: 'ReUpload Your Resume',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UploadResumeOnlyScreen()),
                );
              },
            ),
            UserProfileButton(
              iconPath: 'assets/saved_icon.png',
              text: 'Saved Internships',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SavedInternshipsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
