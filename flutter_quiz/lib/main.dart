import 'package:flutter/material.dart';
import 'package:quiz/answer.dart';
import 'package:quiz/question.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'question': 'What is your favorite color?',
      'answers': [
        {'text': '1', 'score': 10},
        {'text': '2', 'score': 20},
        {'text': '3', 'score': 30},
      ]
    },
    {
      'question': 'What do you like?',
      'answers': [
        {'text': '1', 'score': 10},
        {'text': '2', 'score': 20},
        {'text': '3', 'score': 30},
      ]
    },
    {
      'question': 'What is your favorite animal?',
      'answers': [
        {'text': '1', 'score': 10},
        {'text': '2', 'score': 20},
        {'text': '3', 'score': 30},
      ]
    },
  ];

  var _questionIndex = 0;
  var _resultScore = 0;

  void _answerQuestion(int score) {
    setState(() {
      _resultScore += score;
      _questionIndex++;
    });
  }

  void _resetAnswers() {
    setState(() {
      _questionIndex = 0;
      _resultScore = 0;
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('AppBar')),
        body: _questionIndex < questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: questions,
              )
            : Result(
                score: _resultScore,
                onPress: _resetAnswers,
              ),
      ),
    );
  }
}
