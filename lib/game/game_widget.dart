import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart' as spinner;

import 'package:guess_the_text/game/letters-widget.dart';
import 'package:guess_the_text/game/work_session_conclusion_widget.dart';
import 'package:guess_the_text/game/work_session_text_widget.dart';
import 'package:guess_the_text/model/word_to_guess.dart';
import 'package:guess_the_text/services/hangman_service.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  final HangmanService service = HangmanService.singleton;
  late TextToGuess textToGuess;
  Map data = {};
  bool isShuffling = false;

  @override
  void initState() {
    super.initState();

    String newText = service.shuffle().normalized;
    textToGuess = TextToGuess(characters: newText);
  }

  void reset() {
    setState(() {
      isShuffling = true;
    });

    const duration = Duration(milliseconds: 400);
    Timer(duration, () {
      setState(() => ({
            textToGuess = TextToGuess(characters: service.shuffle().normalized),
            isShuffling = false
          }));
    });
  }

  void tryLetter(String c) {
    setState(() => textToGuess.tryChar(c: c));
  }

  void appBarMenuItemClick(String value) async {
    switch (value) {
      case 'Categories':
        dynamic result = await Navigator.pushNamed(context, '/categories');
        print('new category: ${result.toString()}');
        reset();
        break;
      case 'A propos...':
        Navigator.pushNamed(context, '/about');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty
        ? ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>
        : data;
    print(data['categories']);

    String currentStateImg =
        "assets/images/${textToGuess.currentStateImage()}.png";

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        centerTitle: true,
        backgroundColor: Colors.orange[700],
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: appBarMenuItemClick,
            itemBuilder: (BuildContext context) {
              return {'Categories', 'A propos...'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isShuffling
                ? const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: spinner.SpinKitWave(color: Colors.orange, size: 30),
                  )
                : WordSessionText(textToGuess: textToGuess, isHiddenMode: true),
            Expanded(child: Image.asset(currentStateImg)),
            textToGuess.isGameOver()
                ? WordSessionConclusion(textToGuess: textToGuess)
                : LettersWidget(
                    textToGuess: textToGuess, onLetterPressed: tryLetter),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: reset,
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
