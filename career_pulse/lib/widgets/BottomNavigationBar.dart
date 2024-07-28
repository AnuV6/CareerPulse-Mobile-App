// ignore: file_names
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
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 5), // Reduced padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem('assets/NavhomeIcon.png', 0),
          _buildNavItem('assets/NavCareerIcon.png', 1),
          _buildNavItem('assets/NavProfileIcon.png', 2),
          _buildNavItem('assets/NavSettingIcon.png', 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(String imagePath, int index) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: MouseRegion(
        onEnter: (_) {},
        onExit: (_) {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(vertical: 5), 
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: isSelected ? 35 : 25, 
                height: isSelected ? 35 : 25, 
                decoration: isSelected
                    ? BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 192, 255, 247)
                                .withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      )
                    : null,
                child: Image.asset(
                  imagePath,
                  color: isSelected
                      ? const Color.fromARGB(255, 51, 63, 235)
                      : const Color.fromARGB(255, 51, 131, 235),
                ),
              ),
              const SizedBox(height: 3), 
            ],
          ),
        ),
      ),
    );
  }
}

// Usages
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
