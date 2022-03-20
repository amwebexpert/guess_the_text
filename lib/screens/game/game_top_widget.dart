import 'package:flutter/material.dart';
import 'package:guess_the_text/model/word_to_guess.dart';
import 'package:guess_the_text/screens/game/work_session_text_loading_widget.dart';
import 'package:guess_the_text/screens/game/work_session_text_widget.dart';

class GameTopWidget extends StatelessWidget {
  final TextToGuess textToGuess;
  final bool isShuffling;

  const GameTopWidget({Key? key, required this.textToGuess, required this.isShuffling}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isShuffling) {
      return const WordSessionTextLoading();
    }

    return WordSessionText(textToGuess: textToGuess);
  }
}
