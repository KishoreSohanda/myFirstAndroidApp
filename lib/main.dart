// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final questions = const [
    {
      'questionText': 'What\'s your favourite colour',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9}
      ]
    },
    {
      'questionText': 'Who\'s your favourite instructor',
      'answers': [
        {'text': 'max', 'score': 1},
        {'text': 'max', 'score': 1},
        {'text': 'max', 'score': 1},
        {'text': 'max', 'score': 1}
      ]
    }
  ];
  void answerQuestion(int score) {
    _totalScore+=score;
    setState(() {
      _questionIndex++;
    });
    if (_questionIndex < questions.length) {
      print('more questions are there');
    } else {
      print('no morequestions');
    }
    print(_questionIndex);
  }
  void _resetQuiz(){
    setState(() {
    _questionIndex=0;
    _totalScore=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('My First App')),
      body: _questionIndex < questions.length
          ? Quiz(
              answerQuestion: answerQuestion,
              questionIndex: _questionIndex,
              questions: questions,
            )
          : Result(_totalScore,_resetQuiz),
    ));
  }
}
