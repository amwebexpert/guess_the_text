import 'dart:async';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:guess_the_text/categories/categories_widget.dart';
import 'package:guess_the_text/game/game_widget.dart';
import 'package:guess_the_text/loading/loading_widget.dart';
import 'package:guess_the_text/about/about_widget.dart';
import 'package:guess_the_text/store/preferences.dart';

void main() => runApp(const HangmanApp());

class HangmanApp extends StatefulWidget {
  const HangmanApp({Key? key}) : super(key: key);

  @override
  State<HangmanApp> createState() => _HangmanAppState();
}

class _HangmanAppState extends State<HangmanApp> {
  final PreferencesStore preferences = PreferencesStore();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      Timer(const Duration(seconds: 3), preferences.toggleLocale);

      return MaterialApp(
        // debugShowCheckedModeBanner: false, // uncomment to take screen captures without the banner
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: preferences.locale,
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
    });
  }
}
