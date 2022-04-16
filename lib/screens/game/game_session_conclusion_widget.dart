import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guess_the_text/screens/game/text_to_guess_template_widget.dart';
import 'package:guess_the_text/store/game/game.store.dart';

class GameSessionConclusion extends StatelessWidget {
  const GameSessionConclusion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameStore gameStore = GameStore();
    final MaterialColor color = gameStore.textToGuess.isGameOverWithSuccess() ? Colors.green : Colors.red;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 140,
            height: 140,
            child: SvgPicture.asset(
              gameStore.gameOverImage,
              color: color,
            ),
          ),
          const TextToGuessTemplate(),
        ],
      ),
    );
  }
}
