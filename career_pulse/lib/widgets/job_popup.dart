// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JobPopup extends StatelessWidget {
  final String companyName;
  final String roleTitle;
  final String location;
  final String datePosted;
  final String daysAgo;
  final String jobUrl; // URL for the job post

  const JobPopup({
    super.key,
    required this.companyName,
    required this.roleTitle,
    required this.location,
    required this.datePosted,
    required this.daysAgo,
    required this.jobUrl,
  });

  // Function to launch the job URL or show a message if the link is not available
  Future<void> _launchURL(BuildContext context) async {
    const String fallbackUrl = 'https://www.linkedin.com/jobs/';
    String urlToLaunch = jobUrl;

    if (jobUrl.isEmpty) {
      urlToLaunch = fallbackUrl;
    } else {
      final Uri? checkUrl = Uri.tryParse(jobUrl);
      if (checkUrl == null || !(await canLaunchUrl(checkUrl))) {
        urlToLaunch = fallbackUrl;
      }
    }

    final Uri url = Uri.parse(urlToLaunch);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch job URL')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double dialogWidth = screenWidth * 0.8; // Set dialog width to 80% of screen width

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: dialogWidth, // Limit the dialog width
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              CircleAvatar(
                radius: screenWidth * 0.12,
                backgroundColor: Colors.blueAccent,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: screenWidth * 0.02),
              Text(
                companyName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.05,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis, // Handle text overflow
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(
                roleTitle,
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis, // Handle text overflow
              ),
              SizedBox(height: screenWidth * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.location_on,
                    color: Colors.blueAccent,
                    size: 16,
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Flexible(
                    child: Text(
                      location,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis, // Handle text overflow
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(
                'Date: $datePosted',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(
                daysAgo,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: screenWidth * 0.04),
              ElevatedButton(
                onPressed: () => _launchURL(context),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(screenWidth * 0.12),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Visit Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
