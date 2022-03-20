import 'package:flutter/material.dart';
import 'package:guess_the_text/model/word_to_guess.dart';
import 'package:guess_the_text/screens/game/text_to_guess_template_widget.dart';

class GameSessionConclusion extends StatelessWidget {
  final TextToGuess textToGuess;

  const GameSessionConclusion({Key? key, required this.textToGuess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String gameOverImage = "assets/images/${textToGuess.gameOverImage()}.png";
    MaterialColor color = textToGuess.isGameOverWithSuccess() ? Colors.green : Colors.red;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 140,
            child: Image.asset(
              gameOverImage,
              color: color,
            ),
          ),
          TextToGuessTemplate(
            text: textToGuess.original,
          ),
        ],
      ),
    );
  }
}
