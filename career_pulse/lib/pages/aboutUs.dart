// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart';
import 'package:career_pulse/widgets/BottomNavigationBar.dart'; // Ensure correct import of your custom widget

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  int _selectedIndex = 0; // Initial index for the bottom navigation bar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the index on tap
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'About Us'), // Custom app bar with a back button
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Adding the image asset with controlled size
            SizedBox(
              width: double
                  .infinity, // Ensures the container takes the full width available
              height: 150, // Fixed height for the image container
              child: Image.asset(
                'assets/AboutUsLogo.png', // Local path in your Flutter assets
                fit: BoxFit
                    .contain, // Ensures the image is contained within the container without distortion
              ),
            ),
            const SizedBox(height: 16),
            _buildHeadingWithLine('About Us'),
            const SizedBox(height: 8),
            const Text(
              'Welcome to CareerPulse, the innovative mobile application designed to enhance your daily life with cutting-edge technology and user-friendly features. Our mission is to bring convenience, efficiency, and enjoyment to your fingertips, revolutionizing the way you interact with your mobile device.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            _buildHeadingWithLine('Who We Are'),
            const SizedBox(height: 8),
            const Text(
              'At [Your Company Name], we are a dedicated team of tech enthusiasts, designers, and developers who are passionate about creating exceptional mobile experiences. With a diverse background in software engineering, user experience design, and digital marketing, we work tirelessly to deliver a product that not only meets but exceeds your expectations.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            _buildHeadingWithLine('Our Commitment'),
            const SizedBox(height: 8),
            const Text(
              'We are committed to providing a seamless and enjoyable user experience. Our team continuously updates and improves the app based on your feedback and the latest technological advancements. We value your trust and strive to maintain the highest standards of quality, security, and customer service.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Thank you for choosing [Your App Name]. We are excited to be part of your journey and look forward to bringing more value to your mobile experience.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            _buildHeadingWithLine('Contact Us'),
            const SizedBox(height: 8),
            const Text(
              'If you have any questions, feedback, or need assistance, please don’t hesitate to reach out to our support team at careerpulse.info.lk. We are here to help!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
