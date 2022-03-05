import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:guess_the_text/categories/categories_widget.dart';
import 'package:guess_the_text/game/game_widget.dart';
import 'package:guess_the_text/loading/loading_widget.dart';
import 'package:guess_the_text/about/about_widget.dart';

void main() => runApp(const HangmanApp());

class HangmanApp extends StatefulWidget {
  const HangmanApp({Key? key}) : super(key: key);

  @override
  State<HangmanApp> createState() => _HangmanAppState();
}

class _HangmanAppState extends State<HangmanApp> {
  Locale _locale = Locale(Platform.localeName.split('_')[0]);

  changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 10), () {
      print('Platform.localeName: ${Platform.localeName}');
      String newLanguageCode = _locale.languageCode == 'en' ? 'fr' : 'en';
      changeLanguage(Locale(newLanguageCode));
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
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
