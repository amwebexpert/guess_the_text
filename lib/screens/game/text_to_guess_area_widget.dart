import 'package:flutter/material.dart';
import 'package:guess_the_text/model/word_to_guess.dart';
import 'package:guess_the_text/screens/game/text_to_guess_shuffling.dart';
import 'package:guess_the_text/screens/game/text_to_guess_with_category_widget.dart';

class TextToGuessArea extends StatelessWidget {
  final TextToGuess textToGuess;
  final bool isShuffling;

  const TextToGuessArea({Key? key, required this.textToGuess, required this.isShuffling}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isShuffling) {
      return const TextToGuessShuffling();
    }

    return TextToGuessWithCategory(textToGuess: textToGuess);
  }
}
