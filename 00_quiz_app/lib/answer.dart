import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function onPressHandler;
  final String answerText;
  final int score;

  Answer(this.onPressHandler, this.answerText, this.score);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => onPressHandler(score),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.yellow),
            backgroundColor: MaterialStateProperty.all(Colors.blue)),
        child: Text(answerText),
      ),
    );
  }
}
