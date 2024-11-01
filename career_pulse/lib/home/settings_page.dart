import 'package:flutter/material.dart';
import 'package:career_pulse/stuffs/colors.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart'; // Import CustomAppBar
import 'package:career_pulse/widgets/settings_button_widget.dart'; // Import SettingsButtonWidget
import 'package:career_pulse/home/logout_confirmation_dialog.dart'; // Import LogoutConfirmationDialog
import 'package:career_pulse/pages/password.dart'; // Import your password.dart file
import 'package:career_pulse/pages/aboutus.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const LogoutConfirmationDialog();
      },
    );
  }

  void _navigateToPasswordSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  void _navigateToAboutUs(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AboutUsPage(),
      ),
    );
  }

  void _showComingSoonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Coming Soon"),
          content: const Text("Dark mode is coming soon!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
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
        title: 'Settings',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SettingsButtonWidget(
            onTap: () {},
            child: Container(
              height: 50.0, // Fixed height for consistency
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.notifications,
                          color: AppColors.primaryColor), // Change color here
                      SizedBox(width: 8.0),
                      Text(
                        'Notifications',
                        style: TextStyle(
                          color: AppColors.primaryColor, // Change color here
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Transform.scale(
                    scale: 0.8, // Adjust the scale as needed
                    child: Switch(
                      value: notificationsEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          notificationsEnabled = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SettingsButtonWidget(
            onTap: () {},
            child: Container(
              height: 50.0, // Fixed height for consistency
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.nights_stay,
                          color: AppColors.primaryColor), // Change color here
                      SizedBox(width: 8.0),
                      Text(
                        'Dark mode',
                        style: TextStyle(
                          color: AppColors.primaryColor, // Change color here
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Transform.scale(
                    scale: 0.8, // Adjust the scale as needed
                    child: Switch(
                      value: darkModeEnabled,
                      onChanged: (bool value) {
                        _showComingSoonDialog(context); // Show "Coming soon" message
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SettingsButtonWidget(
            onTap: () {
              _navigateToPasswordSettings(context); // Navigate to Password settings
            },
            child: Container(
              height: 50.0, // Fixed height for consistency
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lock, color: AppColors.primaryColor), // Change color here
                      SizedBox(width: 8.0),
                      Text(
                        'Password',
                        style: TextStyle(
                          color: AppColors.primaryColor, // Change color here
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios,
                      color: AppColors.primaryColor), // Change color here
                ],
              ),
            ),
          ),
          SettingsButtonWidget(
            onTap: () {
              _navigateToAboutUs(context); // Navigate to About Us page
            },
            child: Container(
              height: 50.0, // Fixed height for consistency
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info, color: AppColors.primaryColor), // Change color here
                      SizedBox(width: 8.0),
                      Text(
                        'About Us',
                        style: TextStyle(
                          color: AppColors.primaryColor, // Change color here
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios,
                      color: AppColors.primaryColor), // Change color here
                ],
              ),
            ),
          ),
          SettingsButtonWidget(
            onTap: () => _showLogoutDialog(context),
            child: Container(
              height: 50.0, // Fixed height for consistency
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.logout, color: AppColors.primaryColor), // Change color here
                      SizedBox(width: 8.0),
                      Text(
                        'Logout',
                        style: TextStyle(
                          color: AppColors.primaryColor, // Change color here
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios,
                      color: AppColors.primaryColor), // Change color here
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
