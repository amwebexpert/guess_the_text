import 'package:flutter/material.dart';
import 'package:guess_the_text/features/game/text_to_guess.model.dart';

import 'letter.widget.dart';

class LettersWidget extends StatelessWidget {
  static const List<String> letters = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  final void Function(String c) onLetterPressed;
  final TextToGuess textToGuess;

  const LettersWidget({Key? key, required this.textToGuess, required this.onLetterPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      spacing: 1,
      children: letters
          .map((c) =>
              LetterWidget(letter: c, isButtonEnable: !textToGuess.isCharTried(c), onLetterPressed: onLetterPressed))
          .toList(),
    );
  }
}
