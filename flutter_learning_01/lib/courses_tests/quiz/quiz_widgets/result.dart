import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result({this.resultScore, this.resetHandler});

  String get resultPhrase {
    var resultText;

    if (resultScore < 6) {
      resultText = 'so, OK.';
    } else if (resultScore < 15) {
      resultText = 'Really?!';
    } else if (resultScore < 25) {
      resultText = 'What\'s wrong with you?';
    } else {
      resultText = 'Who you are really?!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600,
                fontSize: 32),
            textAlign: TextAlign.center,
          ),
          FlatButton(onPressed: resetHandler, child: Text('ReStart the Quiz!'))
        ],
      ),
    );
  }
}
