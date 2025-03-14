import 'package:flutter/material.dart';
import 'package:quiz_app/landing_page.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: const Center(
        child: LandingPage(),
      ),
    );
  }
}
