import 'package:flutter/material.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  int _currentIndex = 0; // Index for current tab

  // List of pages to navigate through bottom navigation bar
  final List<Widget> _children = [
    const HomeScreen(), // Replace with your actual home screen widget
    const ProfileScreen(), // Replace with your actual profile screen widget
  ];

  // Function to handle navigation tab change
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen 1224'),
        backgroundColor: const Color.fromARGB(255, 29, 164, 5),
      ),
      body: _children[_currentIndex], // Display current tab page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Current index
        onTap: onTabTapped, // Function to handle tap on each tab
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Icon for Home tab
            label: 'Home', // Label for Home tab
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Icon for Profile tab
            label: 'Profile', // Label for Profile tab
          ),
        ],
      ),
    );
  }
}

// Example screens for bottom navigation tabs
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen'),
    );
  }
}
