import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guess_the_text/screens/game/letters.widget.dart';
import 'package:guess_the_text/screens/game/game_session_conclusion.widget.dart';
import 'package:guess_the_text/store/game/game.store.dart';

class GameBottomWidget extends StatelessWidget {
  const GameBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameStore gameStore = GameStore();

    return Observer(builder: (BuildContext context) {
      if (gameStore.textToGuess.isGameOver()) {
        return const GameSessionConclusion();
      }

      return LettersWidget(textToGuess: gameStore.textToGuess, onLetterPressed: gameStore.tryLetter);
    });
  }
}
