// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function()? onBack;

  const CustomAppBar({super.key, required this.title, this.onBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: onBack ??
            () {
              Navigator.of(context).pop();
            },
      ),
      title: Text(title),
      centerTitle: true,
      backgroundColor:
          const Color.fromARGB(255, 148, 147, 147), // Customize your color
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
