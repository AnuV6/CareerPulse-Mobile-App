import 'package:flutter/material.dart';

class JobPopup extends StatelessWidget {
  final String companyName;
  final String roleTitle;
  final String location;
  final String datePosted;
  final String daysAgo;

  const JobPopup({
    super.key,
    required this.companyName,
    required this.roleTitle,
    required this.location,
    required this.datePosted,
    required this.daysAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
              radius: 40,
              backgroundColor: Colors.blueAccent,
              child: Image.asset(
                'assets/logo.png', // Update with your image path or pass a logo path dynamically
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              companyName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              roleTitle,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.location_on,
                  color: Colors.blueAccent,
                  size: 16,
                ),
                const SizedBox(width: 5),
                Text(
                  location,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              'Date: $datePosted',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              daysAgo,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your action here
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), // Button height
              ),
              child: const Text('Visit Now'),
            ),
          ],
        ),
      ),
    );
  }
}
