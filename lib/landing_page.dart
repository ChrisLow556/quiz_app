import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(151, 255, 255, 255),
        ),
        const SizedBox(height: 50),
        const Text(
          'Learn flutter the fun way ! ',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: () {
            print("button pressed");
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.white, width: 2),
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz'),
        ),
      ],
    );
  }
}
