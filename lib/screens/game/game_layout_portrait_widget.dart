import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guess_the_text/screens/game/game_interaction_panel_widget.dart';
import 'package:guess_the_text/screens/game/text_to_guess_panel_widget.dart';
import 'package:guess_the_text/store/game/game.store.dart';

class GameLayoutPortraitWidget extends StatelessWidget {
  final GameStore gameStore = GameStore();

  GameLayoutPortraitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextToGuessArea(textToGuess: gameStore.textToGuess, isShuffling: gameStore.isLoading),
            Expanded(child: SvgPicture.asset(gameStore.currentStateImg)),
            GameBottomWidget(textToGuess: gameStore.textToGuess, tryLetter: gameStore.tryLetter),
          ],
        ),
      );
    });
  }
}
