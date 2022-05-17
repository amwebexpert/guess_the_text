import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guess_the_text/screens/game/game_interaction_panel.widget.dart';
import 'package:guess_the_text/screens/game/text_to_guess_panel.widget.dart';
import 'package:guess_the_text/store/game/game.store.dart';

class GameLayoutPortraitWidget extends StatelessWidget {
  final bool isLoading;
  const GameLayoutPortraitWidget({Key? key, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameStore gameStore = GameStore();

    return Observer(builder: (BuildContext context) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextToGuessArea(isLoading: isLoading),
            Expanded(child: SvgPicture.asset(gameStore.currentStateImg)),
            const GameBottomWidget(),
          ],
        ),
      );
    });
  }
}
