import 'package:flutter/material.dart';
import 'package:guess_the_text/theme/theme.utils.dart';

const appFontFamily = 'IndieFlower';

const _textTheme = TextTheme(
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
);

final themeDataDark = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.orange, accentColor: Colors.orange[700], brightness: Brightness.dark),
  fontFamily: appFontFamily,
  textTheme: _textTheme,
);

final themeDataLight = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.orange, accentColor: Colors.orange[700], brightness: Brightness.light),
  fontFamily: appFontFamily,
  textTheme: _textTheme,
);

final listTileTralingButtonStyle =
    ElevatedButton.styleFrom(shape: const CircleBorder(), padding: EdgeInsets.all(spacing(1)), primary: Colors.orange);
