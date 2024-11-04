import 'package:flutter/material.dart';
import 'package:career_pulse/stuffs/colors.dart';

class ScoreWidget extends StatelessWidget {
  final int score;
  final String comment;

  const ScoreWidget({super.key, required this.score, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Material(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(25),
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {
              // Define action on tap if necessary, such as navigating to another page
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white, // Background color for the score card
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/trophy.png',
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Score is $score%.",
                        style: const TextStyle(
                          fontSize: 22,
                          color: AppColors.textColorinBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        comment,
                        style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.textColorinBlue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
