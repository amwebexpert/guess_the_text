import 'package:flutter/material.dart';

final themeData = ThemeData(
  primarySwatch: Colors.orange,
  brightness: Brightness.dark,
  backgroundColor: Colors.orange[700],
  primaryColor: Colors.orange[700],
  fontFamily: 'IndieFlower',
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 48.0),
    headline2: TextStyle(fontSize: 40.0),
    headline3: TextStyle(fontSize: 32.0),
    headline4: TextStyle(fontSize: 28.0),
    headline5: TextStyle(fontSize: 24.0),
    headline6: TextStyle(fontSize: 20.0),
    subtitle1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    subtitle2: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 16.0),
    bodyText2: TextStyle(fontSize: 14.0),
    caption: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
  ),
);
