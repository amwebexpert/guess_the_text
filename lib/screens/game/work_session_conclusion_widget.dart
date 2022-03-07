import 'package:flutter/material.dart';
import 'package:guess_the_text/model/word_to_guess.dart';
import 'package:guess_the_text/screens/game/work_session_text_widget.dart';

class WordSessionConclusion extends StatelessWidget {
  final TextToGuess textToGuess;

  const WordSessionConclusion({Key? key, required this.textToGuess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String gameOverImage = "assets/images/${textToGuess.gameOverImage()}.png";
    MaterialColor color = textToGuess.isGameOverWithSuccess() ? Colors.green : Colors.red;

    return Column(
      children: [
        SizedBox(
          width: 140,
          child: Image.asset(
            gameOverImage,
            color: color,
          ),
        ),
        WordSessionText(textToGuess: textToGuess, isHiddenMode: false),
      ],
    );
  }
}
