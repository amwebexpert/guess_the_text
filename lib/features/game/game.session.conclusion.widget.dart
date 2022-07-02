import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/features/game/game.store.dart';
import '/features/game/text_to_guess/text.to.guess.widget.dart';
import '/service.locator.dart';

class GameSessionConclusion extends StatelessWidget {
  const GameSessionConclusion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameStore gameStore = serviceLocator.get();
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
          TextToGuessWidget(text: gameStore.textToGuess.original, isAnimated: true, isLoading: false),
        ],
      ),
    );
  }
}
