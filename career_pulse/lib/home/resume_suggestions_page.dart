// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart';

class ResumeSuggestionsPage extends StatefulWidget {
  const ResumeSuggestionsPage({super.key});

  @override
  State<ResumeSuggestionsPage> createState() => _ResumeSuggestionsPageState();
}

class _ResumeSuggestionsPageState extends State<ResumeSuggestionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title:
              'Suggestion to Improve Resume'), // Custom app bar with a back button
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Adding the image asset with controlled size
            SizedBox(
              width: double
                  .infinity, // Ensures the container takes the full width available
              height: 100, // Fixed height for the image container
              child: Image.asset(
                'assets/thumbs_up.png',
                fit: BoxFit
                    .contain, // Ensures the image is contained within the container without distortion
              ),
            ),
            const SizedBox(height: 16),
            _buildHeadingWithLine('Contact Information'),
            const SizedBox(height: 8),
            const Text(
              'Ensure your name, phone number, email address, and LinkedIn profile (if applicable) are up to date and clearly visible at the top of your resume.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            _buildHeadingWithLine('Professional Summary'),
            const SizedBox(height: 8),
            const Text(
              'Craft a concise summary that highlights your key skills, experience, and career objectives. Tailor it to the job you are applying for.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            _buildHeadingWithLine('Education'),
            const SizedBox(height: 8),
            const Text(
              'Clearly state your educational background, including the name of the institution, degree obtained, and dates attended. Include any relevant coursework or honors.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            _buildHeadingWithLine('Certifications'),
            const SizedBox(height: 8),
            const Text(
              'List your certifications prominently, especially the new "Foundations of User Experience (UX) Design" from Google. Mention the date of certification and any relevant skills acquired.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            _buildHeadingWithLine('Professional Experience'),
            const SizedBox(height: 8),
            const Text(
              'List your work experience in reverse chronological order. Use bullet points to describe your responsibilities and achievements. Quantify your accomplishments with numbers, percentages, or specific results. Focus on relevant experiences that match the job you are applying for.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            _buildHeadingWithLine('Skills'),
            const SizedBox(height: 8),
            const Text(
              'Include a skills section that highlights your technical and soft skills. Be specific (e.g., JavaScript, HTML, CSS, Python, problem-solving, teamwork).',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            _buildHeadingWithLine('Projects'),
            const SizedBox(height: 8),
            const Text(
              'Detail your projects, such as the "Color Sorting and Assembly of Two Objects" project. Describe your role, technologies used, and the outcome or impact of the project. Use bullet points for clarity.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            _buildHeadingWithLine('Achievements and Awards'),
            const SizedBox(height: 8),
            const Text(
              'Include any awards or recognitions you\'ve received. Describe the context and significance of each award.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            _buildHeadingWithLine('Professional Development'),
            const SizedBox(height: 8),
            const Text(
              'Mention any ongoing professional development or training you are undertaking. Include workshops, seminars, or online courses relevant to your career goals.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            _buildHeadingWithLine('Additional Sections'),
            const SizedBox(height: 8),
            const Text(
              'If applicable, add sections for volunteer work, languages spoken, or professional affiliations.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            _buildHeadingWithLine('Formatting'),
            const SizedBox(height: 8),
            const Text(
              'Use a clean, professional layout with consistent formatting. Choose an easy-to-read font and maintain sufficient white space. Use bold or italics to highlight key information, but don\'t overdo it.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeadingWithLine(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
