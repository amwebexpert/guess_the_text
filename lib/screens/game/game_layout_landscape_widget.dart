import 'package:flutter/material.dart';
import 'package:guess_the_text/model/word_to_guess.dart';
import 'package:guess_the_text/screens/game/game_bottom_widhet.dart';
import 'package:guess_the_text/screens/game/game_top_widget.dart';

class GameLayoutLandscapeWidget extends StatelessWidget {
  final TextToGuess textToGuess;
  final void Function(String c) tryLetter;
  final bool isShuffling;
  final String currentStateImg;

  const GameLayoutLandscapeWidget(
      {Key? key,
      required this.textToGuess,
      required this.tryLetter,
      required this.isShuffling,
      required this.currentStateImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GameTopWidget(textToGuess: textToGuess, isShuffling: isShuffling),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: <Widget>[
                Flexible(flex: 3, child: GameBottomWidget(textToGuess: textToGuess, tryLetter: tryLetter)),
                Flexible(flex: 2, child: Image.asset(currentStateImg)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
