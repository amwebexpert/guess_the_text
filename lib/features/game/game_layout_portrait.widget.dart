import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guess_the_text/features/game/game_interaction_panel.widget.dart';
import 'package:guess_the_text/features/game/text_to_guess_panel.widget.dart';
import 'package:guess_the_text/features/game/game.store.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/store/fixed.delay.spinner.store.dart';

class GameLayoutPortraitWidget extends StatelessWidget {
  final GameStore gameStore = serviceLocator.get();
  final FixedDelaySpinnerStore fixedDelaySpinnerStore = serviceLocator.get();

  GameLayoutPortraitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextToGuessArea(isLoading: fixedDelaySpinnerStore.isLoading),
            Expanded(child: SvgPicture.asset(gameStore.currentStateImg)),
            const GameBottomWidget(),
          ],
        ),
      );
    });
  }
}
