import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import "package:flutter_quiz_app/data/questions.dart";
import "package:flutter_quiz_app/answer_button.dart";

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(
      () {
        currentQuestionIndex++;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      // we take size box to take entire screen
      width: double.infinity, // use as much as width possible
      child: Container(
        // this container is created to set margin to left, right, top, bottom of Column
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, // it will centered all the  elements of column
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // the item inside the column will stretch out as wide as possible
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 40, 23, 53),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswer().map((answer) {
              // triple dot is spread operator to return only individual widgets
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
