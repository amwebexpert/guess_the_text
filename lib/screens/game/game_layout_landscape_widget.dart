import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guess_the_text/screens/game/game_interaction_panel_widget.dart';
import 'package:guess_the_text/screens/game/text_to_guess_panel_widget.dart';
import 'package:guess_the_text/store/game/game.store.dart';

class GameLayoutLandscapeWidget extends StatelessWidget {
  const GameLayoutLandscapeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameStore gameStore = GameStore();

    return Observer(builder: (BuildContext context) {
      return Column(
        children: [
          const TextToGuessArea(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Flexible(flex: 3, child: GameBottomWidget()),
                  Flexible(flex: 2, child: SvgPicture.asset(gameStore.currentStateImg)),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
