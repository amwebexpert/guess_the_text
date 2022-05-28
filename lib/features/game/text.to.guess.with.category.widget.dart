import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guess_the_text/features/game/game.store.dart';
import 'package:guess_the_text/service.locator.dart';

import 'text.to.guess.template.widget.dart';

class TextToGuessWithCategory extends StatelessWidget {
  const TextToGuessWithCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameStore gameStore = serviceLocator.get();
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Observer(builder: (BuildContext context) {
      final text = gameStore.textToGuess.wordGame();

      return isPortrait
          ? Column(
              children: [
                CategoryLabel(),
                TextToGuessTemplate(text: text, isAnimated: false),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextToGuessTemplate(text: text, isAnimated: false),
                CategoryLabel(),
              ],
            );
    });
  }
}

class CategoryLabel extends StatelessWidget {
  final GameStore gameStore = serviceLocator.get();

  CategoryLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      return Text(
        gameStore.currentCategory.name,
        style: Theme.of(context).textTheme.bodyText2,
      );
    });
  }
}
