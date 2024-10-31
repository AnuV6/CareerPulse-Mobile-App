import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:career_pulse/widgets/user_profile_button.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart';
import 'package:career_pulse/stuffs/colors.dart';
import 'package:career_pulse/home/saved_internships_page.dart';
import 'package:career_pulse/pages/interested_area_screen.dart';
import 'package:career_pulse/home/upload_resume_only.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String userName = 'User';
  String userImagePath = 'assets/user_image.jpg'; // Default local asset
  File? _image;

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
    _loadLocalProfileImage();
  }

  /// Fetch user's name from Firestore
  Future<void> _fetchUserProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        if (doc.exists) {
          setState(() {
            userName = doc.data()?['fullName'] ?? 'User';
          });
          print("Fetched user name from Firestore: $userName");
        } else {
          print("User document does not exist in Firestore.");
        }
      } catch (e) {
        print("Error fetching user profile: $e");
      }
    } else {
      print("No authenticated user found.");
    }
  }

  /// Load the profile image from local storage, if it exists
  Future<void> _loadLocalProfileImage() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/profile_image.jpg';
      final file = File(path);

      if (await file.exists()) {
        setState(() {
          _image = file;
        });
        print("Loaded profile image from local storage");
      }
    } catch (e) {
      print("Error loading profile image: $e");
    }
  }

  /// Change and save profile picture locally
  Future<void> _changeProfilePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      await _saveImageLocally(File(image.path));
    } else {
      print("No image selected.");
    }
  }

  /// Save the profile image to local storage
  Future<void> _saveImageLocally(File imageFile) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/profile_image.jpg';
      final savedImage = await imageFile.copy(path);
      
      setState(() {
        _image = savedImage;
      });

      print("Profile image saved locally at $path");
    } catch (e) {
      print("Error saving profile image locally: $e");
    }
  }

  /// Change and update user's name
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
              onPressed: () async {
                if (newName.isNotEmpty) {
                  setState(() {
                    userName = newName;
                  });
                  await _updateUserNameInFirestore(newName);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  /// Update the user's name in Firestore
  Future<void> _updateUserNameInFirestore(String newName) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
          'fullName': newName,
        });
        print("User name updated in Firestore");
      } catch (e) {
        print("Error updating user name: $e");
      }
    }
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
