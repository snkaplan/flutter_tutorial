import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function onRestart;

  Result(this.resultScore, this.onRestart);

  String getResultText() {
    return "You Made it. Your score is: " + resultScore.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(getResultText(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center),
          TextButton(
            onPressed: () => onRestart(),
            child: Text('Restart Quiz'),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
