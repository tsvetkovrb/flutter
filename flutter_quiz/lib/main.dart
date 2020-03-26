import 'package:flutter/material.dart';
import 'package:quiz/answer.dart';
import 'package:quiz/question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  var questions = [
    {
      'question': 'What is your favorite color?',
      'answers': ['1', '2', '3']
    },
    {
      'question': 'What do you like?',
      'answers': ['1', '2', '3']
    },
    {
      'question': 'What is your favorite animal?',
      'answers': ['1', '2', '3']
    },
  ];

  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('AppBar')),
        body: Column(
          children: <Widget>[
            Question(questions[_questionIndex]['question']),
            ...(questions[_questionIndex]['answers'] as List<String>).map(
              (answer) => Answer(_answerQuestion, answer),
            ),
          ],
        ),
      ),
    );
  }
}
