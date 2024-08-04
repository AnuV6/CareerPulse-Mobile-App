import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart';
import 'package:career_pulse/widgets/common_blue_button.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  EditProfilePageState createState() => EditProfilePageState();
}

class EditProfilePageState extends State<EditProfilePage> {
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Upload Profile Picture',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.account_circle,
                size: 100,
                color: Color.fromARGB(255, 64, 51, 247),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _image == null
                          ? const Column(
                              children: [
                                Icon(Icons.camera_alt,
                                    size: 50, color: Colors.blueAccent),
                                SizedBox(height: 10),
                                Text(
                                  'Upload Your Image',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Drag your file(s) or browse',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                                Text(
                                  'Max 10 MB files are allowed',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                ),
                              ],
                            )
                          : Image.file(
                              _image!,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CommonButton(
                text: 'Save',
                onPressed: () {
                  // what to do click the save button
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
