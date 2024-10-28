// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function()? onBack;

  const CustomAppBar({super.key, required this.title, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
              color: Color.fromARGB(255, 204, 204, 204),
              width: 1), // Black horizontal line at the bottom
        ),
      ),
      child: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: onBack ??
              () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/homePage', (route) => false);
                }
              },
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: Colors.white, // White background color
        elevation: 0, // Remove default shadow
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}



//Usages
/* 

Scaffold(
  appBar: CustomAppBar(
    title: 'Internships', // This "Internship" text may changed according to usages
    onBack: () => Navigator.of(context).pop(),
  ),
  ...
),

*/
