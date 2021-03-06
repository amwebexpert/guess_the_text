import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/features/game/game.session.conclusion.widget.dart';
import '/features/game/game.store.dart';
import '/features/game/letters.widget.dart';
import '/service.locator.dart';

class GameInteractionPanelWidget extends StatelessWidget {
  const GameInteractionPanelWidget({Key? key}) : super(key: key);

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
