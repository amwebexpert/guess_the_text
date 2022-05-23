import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guess_the_text/features/game/game_interaction_panel.widget.dart';
import 'package:guess_the_text/features/game/text_to_guess_panel.widget.dart';
import 'package:guess_the_text/features/game/game.store.dart';
import 'package:guess_the_text/service.locator.dart';

class GameLayoutLandscapeWidget extends StatelessWidget {
  final GameStore gameStore = serviceLocator.get();

  final bool isLoading;
  GameLayoutLandscapeWidget({Key? key, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      return Column(
        children: [
          TextToGuessArea(isLoading: isLoading),
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
