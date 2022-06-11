import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guess_the_text/features/game/game.image.widget.dart';
import 'package:guess_the_text/features/game/game.interaction.panel.widget.dart';
import 'package:guess_the_text/features/game/game.store.dart';
import 'package:guess_the_text/features/game/text_to_guess/text.to.guess.widget.dart';
import 'package:guess_the_text/features/game/category.widget.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/store/fixed.delay.spinner.store.dart';

class GameLayoutPortraitWidget extends StatelessWidget {
  const GameLayoutPortraitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const <Widget>[
          TextToGuessPanel(),
          Expanded(child: GameImageWidget()),
          GameBottomWidget(),
        ],
      ),
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
      return Column(
        children: [
          const CategoryWidget(),
          TextToGuessWidget(
              text: gameStore.textToGuess.wordGame(), isAnimated: false, isLoading: spinnerStore.isLoading),
        ],
      );
    });
  }
}
