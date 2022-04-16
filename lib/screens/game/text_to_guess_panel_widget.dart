import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guess_the_text/screens/game/text_to_guess_shuffling_widget.dart';
import 'package:guess_the_text/screens/game/text_to_guess_with_category_widget.dart';
import 'package:guess_the_text/store/game/game.store.dart';

class TextToGuessArea extends StatelessWidget {
  const TextToGuessArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameStore gameStore = GameStore();

    return Observer(builder: (BuildContext context) {
      if (gameStore.isLoading) {
        return const TextToGuessShuffling();
      }

      return TextToGuessWithCategory(textToGuess: gameStore.textToGuess);
    });
  }
}
