import 'package:flutter/material.dart';
import 'package:career_pulse/stuffs/colors.dart';

class ScoreWidget extends StatelessWidget {
  final int score;
  final String comment;

  const ScoreWidget({super.key, required this.score, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.circular(25),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () {
          // Define what should happen on tap, if applicable
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
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
                    "Your Score is $score%.", // Dynamically set score
                    style: const TextStyle(
                        fontSize: 22, color: AppColors.textColorinBlue),
                  ),
                  Text(
                    comment,
                    style: const TextStyle(
                        fontSize: 18, color: AppColors.textColorinBlue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
