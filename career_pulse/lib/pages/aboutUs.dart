// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'About Us'),
      body: AboutUsContent(),
    );
  }
}

// Main About Us content widget
class AboutUsContent extends StatelessWidget {
  const AboutUsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 150,
            child: Image.asset(
              'assets/AboutUsLogo.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16),
          _buildHeadingWithLine('About Us'),
          const SizedBox(height: 8),
          const Text(
            'Welcome to CareerPulse, the innovative mobile application designed to enhance your daily life with cutting-edge technology and user-friendly features. Our mission is to bring convenience, efficiency, and enjoyment to your fingertips, revolutionizing the way you interact with your mobile device.',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 16),
          _buildHeadingWithLine('Who We Are'),
          const SizedBox(height: 8),
          const Text(
            'At Faculty of Technology in University of Sri Jayewardanapura, we are a dedicated team of tech enthusiasts, designers, and developers who are passionate about creating exceptional mobile experiences. With a diverse background in software engineering, user experience design, and digital marketing, we work tirelessly to deliver a product that not only meets but exceeds your expectations.',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 16),
          _buildHeadingWithLine('Our Commitment'),
          const SizedBox(height: 8),
          const Text(
            'We are committed to providing a seamless and enjoyable user experience. Our team continuously updates and improves the app based on your feedback and the latest technological advancements. We value your trust and strive to maintain the highest standards of quality, security, and customer service.',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 16),
          const Text(
            'Thank you for choosing CareerPulse. We are excited to be part of your journey and look forward to bringing more value to your mobile experience.',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
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
