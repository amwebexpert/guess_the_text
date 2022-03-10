import 'package:flutter/material.dart';
import 'package:guess_the_text/model/word_to_guess.dart';
import 'package:guess_the_text/screens/game/game_bottom_widhet.dart';
import 'package:guess_the_text/screens/game/game_top_widget.dart';

class GameLayoutPortraitWidget extends StatelessWidget {
  final TextToGuess textToGuess;
  final void Function(String c) tryLetter;
  final bool isShuffling;
  final String currentStateImg;

  const GameLayoutPortraitWidget(
      {Key? key,
      required this.textToGuess,
      required this.tryLetter,
      required this.isShuffling,
      required this.currentStateImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GameTopWidget(textToGuess: textToGuess, isShuffling: isShuffling),
          Expanded(child: Image.asset(currentStateImg)),
          GameBottomWidget(textToGuess: textToGuess, tryLetter: tryLetter),
        ],
      ),
    );
  }
}
