import 'package:flutter/material.dart';
import 'package:career_pulse/stuffs/colors.dart';
import 'package:career_pulse/widgets/AppBarWithBackButton.dart'; // Import CustomAppBar
import 'package:career_pulse/widgets/settings_button_widget.dart'; // Import SettingsButtonWidget
import 'package:career_pulse/home/logout_confirmation_dialog.dart'; // Import LogoutConfirmationDialog

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.notifications, color: AppColors.primaryColor),
                    SizedBox(width: 8.0),
                    Text('Notifications', style: TextStyle(color: AppColors.primaryColor, fontSize: 16.0)),
                  ],
                ),
                Switch(
                  value: notificationsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      notificationsEnabled = value;
                    });
                  },
                ),
              ],
            ),
          ),
          SettingsButtonWidget(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.nights_stay, color: AppColors.primaryColor),
                    SizedBox(width: 8.0),
                    Text('Dark mode', style: TextStyle(color: AppColors.primaryColor, fontSize: 16.0)),
                  ],
                ),
                Switch(
                  value: darkModeEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      darkModeEnabled = value;
                    });
                  },
                ),
              ],
            ),
          ),
          SettingsButtonWidget(
            onTap: () {
              // Navigate to Password settings
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.lock, color: AppColors.primaryColor),
                    SizedBox(width: 8.0),
                    Text('Password', style: TextStyle(color: AppColors.primaryColor, fontSize: 16.0)),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, color: AppColors.primaryColor),
              ],
            ),
          ),
          SettingsButtonWidget(
            onTap: () {
              // Navigate to About Us page
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.info, color: AppColors.primaryColor),
                    SizedBox(width: 8.0),
                    Text('About Us', style: TextStyle(color: AppColors.primaryColor, fontSize: 16.0)),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, color: AppColors.primaryColor),
              ],
            ),
          ),
          SettingsButtonWidget(
            onTap: () => _showLogoutDialog(context),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.logout, color: AppColors.primaryColor),
                    SizedBox(width: 8.0),
                    Text('Logout', style: TextStyle(color: AppColors.primaryColor, fontSize: 16.0)),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, color: AppColors.primaryColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
