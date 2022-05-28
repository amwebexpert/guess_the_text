import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guess_the_text/features/game/letters.widget.dart';
import 'package:guess_the_text/features/game/game.session.conclusion.widget.dart';
import 'package:guess_the_text/features/game/game.store.dart';
import 'package:guess_the_text/service.locator.dart';

class GameBottomWidget extends StatelessWidget {
  const GameBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameStore gameStore = serviceLocator.get();

    return Observer(builder: (BuildContext context) {
      if (gameStore.textToGuess.isGameOver()) {
        return const GameSessionConclusion();
      }

      return LettersWidget(textToGuess: gameStore.textToGuess, onLetterPressed: gameStore.tryLetter);
    });
  }
}
