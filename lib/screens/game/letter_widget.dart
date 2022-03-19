import 'package:flutter/material.dart';
import 'package:guess_the_text/model/word_to_guess.dart';

class LetterWidget extends StatelessWidget {
  final void Function(String c) onLetterPressed;
  final TextToGuess textToGuess;
  final String letter;

  const LetterWidget({Key? key, required this.letter, required this.textToGuess, required this.onLetterPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool letterConsumed = textToGuess.charsTried.contains(letter);

    return ElevatedButton(
      onPressed: letterConsumed ? null : () => onLetterPressed(letter),
      child: Text(
        letter,
        style: Theme.of(context).textTheme.bodyText1?.apply(color: Colors.white),
      ),
    );
  }
}
