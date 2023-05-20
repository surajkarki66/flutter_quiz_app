import 'package:flutter_quiz_app/models/question_quiz.dart';

const questions = [
  QuizQuestion('What are the main building blocks of Flutter UIs?', [
    "Widgets",
    "Components",
    'Blocks',
    "Functions",
  ]),
  QuizQuestion(
      'What programming language is primarily used for developing Flutter apps?',
      ["Dart", "JavaScript", "Python", "C++"]),
  QuizQuestion(
      'Which widget is used to display a single line of editable text in Flutter?',
      ["TextField", "TextFormField", "Text", "EditableText"]),
  QuizQuestion('Which platform(s) can you build apps for using Flutter?',
      ["All of the above", "Android", "iOS", "Web"]),
  QuizQuestion(
      'Which command is used to run a Flutter app from the command line?', [
    "flutter run",
    "flutter build",
    'flutter test',
    "flutter create",
  ])
];
