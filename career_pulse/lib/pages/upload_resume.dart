import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart';
import 'package:career_pulse/pages/PleaseWaitAnalyzing_splash.dart';

class UploadResumeScreen extends StatefulWidget {
  const UploadResumeScreen({super.key});

  @override
  _UploadResumeScreenState createState() => _UploadResumeScreenState();
}

class _UploadResumeScreenState extends State<UploadResumeScreen> {
  PlatformFile? _pickedFile;
  final TextEditingController _linkedinController = TextEditingController();

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
    final linkedinUrl = _linkedinController.text.trim();
    
    if (_pickedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please upload your resume')),
      );
      return;
    }

    if (linkedinUrl.isNotEmpty && !Uri.parse(linkedinUrl).isAbsolute) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid LinkedIn profile link')),
      );
      return;
    }

    // Handle the file and LinkedIn URL submission logic here

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Resume and LinkedIn profile submitted successfully')),
    );

    // Navigate to the PleaseWaitAnalyzingSplash screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PleaseWaitAnalyzingSplash(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: const CustomAppBar(title: 'Upload Your Resume'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Upload Your Resume',
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
              const SizedBox(height: 16),
              const Text(
                'And',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Upload Your LinkedIn profile Link (Optional)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _linkedinController,
                decoration: const InputDecoration(
                  labelText: 'Add LinkedIn URL',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
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