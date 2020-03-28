import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function onPress;

  Result({@required this.score, @required this.onPress});

  String get _resultPhrase {
    String resultText = 'You did it!';

    if (score <= 20) {
      resultText = 'You are awesome';
    } else if (score >= 20 && score < 30) {
      resultText = 'You are great';
    } else {
      resultText = 'Your are amazing!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: <Widget>[
            Text(
              _resultPhrase,
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: RaisedButton(
                onPressed: onPress,
                child: Text('Reset'),
                color: Colors.blue,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
