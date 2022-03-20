import 'package:flutter/material.dart';
import 'package:guess_the_text/model/word_to_guess.dart';

class WordSessionText extends StatelessWidget {
  final TextToGuess textToGuess;
  final bool isHiddenMode;

  const WordSessionText({Key? key, required this.textToGuess, required this.isHiddenMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = isHiddenMode ? textToGuess.wordGame() : textToGuess.original;

    return Text(
      text,
      style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
