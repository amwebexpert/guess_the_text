import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guess_the_text/features/game/game.image.widget.dart';
import 'package:guess_the_text/features/game/game.interaction.panel.widget.dart';
import 'package:guess_the_text/features/game/game.store.dart';
import 'package:guess_the_text/features/game/text_to_guess/text.to.guess.widget.dart';
import 'package:guess_the_text/features/game/category.widget.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/store/fixed.delay.spinner.store.dart';

class GameLayoutLandscapeWidget extends StatelessWidget {
  const GameLayoutLandscapeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextToGuessPanel(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Flexible(flex: 3, child: GameBottomWidget()),
                Flexible(flex: 2, child: GameImageWidget()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TextToGuessPanel extends StatelessWidget {
  const TextToGuessPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameStore gameStore = serviceLocator.get();
    final FixedDelaySpinnerStore spinnerStore = serviceLocator.get();

    return Observer(builder: (BuildContext context) {
      if (spinnerStore.isLoading) {
        return TextToGuessWidget(
            text: gameStore.textToGuess.wordGame(), isAnimated: false, isLoading: spinnerStore.isLoading);
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextToGuessWidget(
              text: gameStore.textToGuess.wordGame(), isAnimated: false, isLoading: spinnerStore.isLoading),
          const CategoryWidget(),
        ],
      );
    });
  }
}
