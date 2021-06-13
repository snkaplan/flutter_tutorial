import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveElevatedButton extends StatelessWidget {
  final String text;
  final Function handler;

  const AdaptiveElevatedButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Platform.isIOS
            ? CupertinoButton(
                child: Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () => {
                  handler(),
                },
              )
            : ElevatedButton(
                onPressed: () => {
                  handler(),
                },
                child: Text(
                  'Choose Date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ));
  }
}
