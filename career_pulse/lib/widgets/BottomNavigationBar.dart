// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      backgroundColor:
          const Color.fromARGB(255, 255, 255, 255), // Customize your color
      selectedItemColor: const Color.fromARGB(255, 51, 63, 235),
      unselectedItemColor: const Color.fromARGB(255, 51, 131, 235),
    );
  }
}



//Usages
/* 

int _selectedIndex = 0;

Scaffold(
  appBar: CustomAppBar(
    title: 'Internships',
    onBack: () => Navigator.of(context).pop(),
  ),
  bottomNavigationBar: CustomBottomNavigationBar(
    currentIndex: _selectedIndex,
    onTap: (index) {
      setState(() {
        _selectedIndex = index;
      });
    },
  ),
  ...
),


*/