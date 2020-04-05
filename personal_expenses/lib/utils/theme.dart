import 'package:flutter/material.dart';

ThemeData customTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    accentColor: Color(0xff00A08A),
    fontFamily: 'Quicksand',
    textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
    appBarTheme: AppBarTheme(
      textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            button: TextStyle(
              color: Colors.white,
            ),
          ),
    ),
  );
}
