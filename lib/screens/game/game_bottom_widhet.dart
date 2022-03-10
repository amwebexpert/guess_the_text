import 'package:flutter/material.dart';
import 'package:guess_the_text/model/word_to_guess.dart';
import 'package:guess_the_text/screens/game/letters_widget.dart';
import 'package:guess_the_text/screens/game/work_session_conclusion_widget.dart';

class GameBottomWidget extends StatelessWidget {
  final TextToGuess textToGuess;
  final void Function(String c) tryLetter;

  const GameBottomWidget({Key? key, required this.textToGuess, required this.tryLetter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (textToGuess.isGameOver()) {
      return WordSessionConclusion(textToGuess: textToGuess);
    }

    return LettersWidget(textToGuess: textToGuess, onLetterPressed: tryLetter);
  }
}
