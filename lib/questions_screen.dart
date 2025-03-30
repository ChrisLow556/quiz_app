import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return OrientationBuilder(
      builder: (context, orientation) {
        return SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 200, 222, 255),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                if (orientation == Orientation.portrait)
                  ...currentQuestion.getShuffledAnswers().map(
                        (answer) => AnswerButton(
                          answerText: answer,
                          onTap: () {
                            answerQuestion(answer);
                          },
                        ),
                      )
                else
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: currentQuestion
                        .getShuffledAnswers()
                        .map(
                          (answer) => SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: AnswerButton(
                              answerText: answer,
                              onTap: () {
                                answerQuestion(answer);
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
