import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guess_the_text/store/game/game.store.dart';

class TextToGuessTemplate extends StatelessWidget {
  const TextToGuessTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameStore gameStore = GameStore();

    return Observer(builder: (BuildContext context) {
      return Text(
        gameStore.textToGuess.wordGame(),
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    });
  }
}
