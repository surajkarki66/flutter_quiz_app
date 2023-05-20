import 'package:flutter/material.dart';

import "package:flutter_quiz_app/data/questions.dart";
import "package:flutter_quiz_app/answer_button.dart";

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
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
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswer().map((answer) {
              // triple dot is spread operator to return only individual widgets
              return AnswerButton(
                answerText: answer,
                onTap: answerQuestion,
              );
            }),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
