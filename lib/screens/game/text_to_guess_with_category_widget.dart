import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guess_the_text/screens/game/text_to_guess_template_widget.dart';
import 'package:guess_the_text/store/game/game.store.dart';

class TextToGuessWithCategory extends StatelessWidget {
  const TextToGuessWithCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameStore gameStore = GameStore();
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Observer(builder: (BuildContext context) {
      return isPortrait
          ? Column(
              children: [
                const CategoryLabel(),
                TextToGuessTemplate(text: gameStore.textToGuess.wordGame()),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextToGuessTemplate(text: gameStore.textToGuess.wordGame()),
                const CategoryLabel(),
              ],
            );
    });
  }
}

class CategoryLabel extends StatelessWidget {
  const CategoryLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameStore gameStore = GameStore();

    return Observer(builder: (BuildContext context) {
      return Text(
        gameStore.currentCategory.name,
        style: Theme.of(context).textTheme.bodyText2,
      );
    });
  }
}
