import 'package:flutter/material.dart';

class QuestionsIndex extends StatelessWidget {
  const QuestionsIndex(
      {super.key, required this.questionsIndex, required this.correctAnswer});

  final int questionsIndex;
  final bool correctAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionsIndex + 1;
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: correctAnswer ? Colors.green : Colors.red,
      ),
      alignment: Alignment.center,
      child: Text(
        (questionNumber.toString()),
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }
}
