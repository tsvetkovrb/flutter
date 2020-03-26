import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function _onPressHandler;
  final String _answerText;

  Answer(this._onPressHandler, this._answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: RaisedButton(
        child: Text(_answerText),
        onPressed: _onPressHandler,
        color: Colors.blue,
        textColor: Colors.white,
      ),
    );
  }
}
