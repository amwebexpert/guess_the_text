import 'package:flutter/material.dart';

import '../model/word_to_guess.dart';

class WordSessionText extends StatelessWidget {
  final TextToGuess textToGuess;
  final bool isHiddenMode;

  const WordSessionText({Key? key, required this.textToGuess, required this.isHiddenMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = this.isHiddenMode ? textToGuess.wordGame() : textToGuess.characters;

    return Text(
      text,
      style: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
        color: Colors.orange[500],
        fontFamily: 'IndieFlower',
      ),
    );
  }
}
