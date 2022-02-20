import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingWidget(),
        '/game': (context) => const GameWidget(),
        '/categories': (context) => const CategoriesWidget(),
        '/about': (context) => const AboutWidget(),
      },
    );
  }
}
