import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart';

class UploadResumeOnlyScreen extends StatefulWidget {
  const UploadResumeOnlyScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UploadResumeOnlyScreenState createState() => _UploadResumeOnlyScreenState();
}

class _UploadResumeOnlyScreenState extends State<UploadResumeOnlyScreen> {
  PlatformFile? _pickedFile;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx'],
    );

    if (result != null) {
      setState(() {
        _pickedFile = result.files.first;
      });
    }
  }

  void _submit() {
    if (_pickedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please upload your resume')),
      );
      return;
    }

    // Handle the file submission logic here

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Resume submitted successfully')),
    );

    // Navigate to the home screen after submission
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: const CustomAppBar(
        title: 'Re-Upload Your Resume',
      ), // Custom app bar with a back button
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Re-Upload Your Resume',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Add your resume here. *This is required.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: _pickFile,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.blue,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.cloud_upload,
                        color: Colors.blue,
                        size: 64,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _pickedFile == null
                            ? 'Drag your file(s) or browse'
                            : _pickedFile!.name,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Max 10 MB files are allowed\nOnly support .pdf and .docx files.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color(0xFF1954EE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
