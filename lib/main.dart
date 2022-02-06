import 'package:flutter/material.dart';
import 'package:guess_the_text/categories/categories_widget.dart';
import 'package:guess_the_text/game/game_widget.dart';
import 'package:guess_the_text/loading/loading_widget.dart';
import 'package:guess_the_text/about/about_widget.dart';

void main() => runApp(const HangmanApp());

class HangmanApp extends StatelessWidget {
  const HangmanApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le pendu numérique',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingWidget(),
        '/game': (context) => GameWidget(),
        '/categories': (context) => CategoriesWidget(),
        '/about': (context) => AboutWidget(),
      },
    );
  }
}

