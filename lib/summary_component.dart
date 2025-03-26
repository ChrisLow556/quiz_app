import 'package:flutter/material.dart';
import 'package:quiz_app/questions_index.dart';

class SummaryComponent extends StatelessWidget {
  const SummaryComponent({
    super.key,
    required this.dataDisplayed,
  });

  final Map<String, Object> dataDisplayed;

  @override
  Widget build(BuildContext context) {
    final bool correctAnswer =
        dataDisplayed['user_answer'] == dataDisplayed['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionsIndex(
          questionsIndex: dataDisplayed['question_index'] as int,
          correctAnswer: correctAnswer,
        ),
        const SizedBox(width: 30),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dataDisplayed['question'] as String,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                dataDisplayed['user_answer'] as String,
                style: const TextStyle(
                  color: Colors.yellow,
                ),
              ),
              Text(
                dataDisplayed['correct_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 235, 125, 255),
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ],
    );
  }
}
