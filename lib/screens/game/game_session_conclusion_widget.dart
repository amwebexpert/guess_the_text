import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guess_the_text/model/word_to_guess.dart';
import 'package:guess_the_text/screens/game/text_to_guess_template_widget.dart';

class GameSessionConclusion extends StatelessWidget {
  final TextToGuess textToGuess;

  const GameSessionConclusion({Key? key, required this.textToGuess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String gameOverImage = "assets/images/${textToGuess.gameOverImage()}.svg";
    MaterialColor color = textToGuess.isGameOverWithSuccess() ? Colors.green : Colors.red;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 140,
            height: 140,
            child: SvgPicture.asset(
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
