import 'package:flutter/material.dart';

final themeData = ThemeData(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
  fontFamily: 'IndieFlower',
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 48.0),
    headline2: TextStyle(fontSize: 40.0),
    headline3: TextStyle(fontSize: 32.0),
    headline4: TextStyle(fontSize: 28.0),
    headline5: TextStyle(fontSize: 24.0),
    headline6: TextStyle(fontSize: 20.0),
    subtitle1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    subtitle2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 18.0),
    bodyText2: TextStyle(fontSize: 16.0),
    caption: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
  ),
);
