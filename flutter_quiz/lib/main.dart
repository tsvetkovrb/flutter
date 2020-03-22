import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('AppBar')),
        body: Column(
          children: <Widget>[
            Text('Hello world!'),
            RaisedButton(
              onPressed: () {
                print('Answer 1');
              },
              child: Text('Answer 1'),
            ),
            RaisedButton(
              onPressed: () {
                print('Answer 2');
              },
              child: Text('Answer 2'),
            ),
            RaisedButton(
              onPressed: () {
                print('Answer 3');
              },
              child: Text('Answer 3'),
            ),
          ],
        ),
      ),
    );
  }
}
