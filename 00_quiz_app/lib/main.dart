import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  bool questionsOver = false;
  final _questions = const [
    {
      'questionText': 'What\'s you favorite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 5},
        {'text': 'Blue', 'score': 8},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 2},
        {'text': 'Cat', 'score': 10},
        {'text': 'Rabbit', 'score': 10},
      ]
    },
    {
      'questionText': 'Who\'s your favorite insturtor?',
      'answers': [
        {'text': 'B', 'score': 2},
        {'text': 'A', 'score': 3},
        {'text': 'D', 'score': 4},
        {'text': 'C', 'score': 6},
      ]
    },
  ];
  void onAnswerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length - 1) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    } else {
      setState(() {
        questionsOver = true;
      });
    }
    print(_totalScore);
  }

  void onRestart() {
    setState(() {
      _questionIndex = 0;
      questionsOver = false;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: !questionsOver
            ? Quiz(
                onAnswerQuestion: onAnswerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, onRestart),
      ),
    );
  }
}
