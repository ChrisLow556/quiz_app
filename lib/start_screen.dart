import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    final screenSize = MediaQuery.of(context).size;

    return OrientationBuilder(
      builder: (context, orientation) {
        final isPortrait = orientation == Orientation.portrait;

        return Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: isPortrait
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _buildContent(isPortrait, screenSize),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildContent(isPortrait, screenSize),
                  ),
          ),
        );
      },
    );
  }

  List<Widget> _buildContent(bool isPortrait, Size screenSize) {
    final image = Image.asset(
      'assets/images/quiz-logo.png',
      width: isPortrait ? screenSize.width * 0.6 : screenSize.height * 0.4,
      color: const Color.fromARGB(151, 255, 255, 255),
    );

    final text = Text(
      'Learn Flutter the fun way!',
      style: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 24,
      ),
    );

    final button = OutlinedButton.icon(
      onPressed: startQuiz,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white, width: 2),
      ),
      icon: const Icon(Icons.arrow_right_alt),
      label: const Text('Start Quiz'),
    );

    return isPortrait
        ? [
            image,
            const SizedBox(height: 50),
            text,
            const SizedBox(height: 20),
            button,
          ]
        : [
            image,
            const SizedBox(width: 40),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text,
                const SizedBox(height: 20),
                button,
              ],
            ),
          ];
  }
}
