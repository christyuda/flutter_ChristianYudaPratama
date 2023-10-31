import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String resultText;

  ResultScreen(this.resultText);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Recommendations:'),
        Text(resultText),
      ],
    );
  }
}
