import 'package:flutter/material.dart';
import 'package:guess_the_text/features/game/game.image.widget.dart';
import 'package:guess_the_text/features/game/game.interaction.panel.widget.dart';
import 'package:guess_the_text/features/game/text.and.category.widget.dart';

class GameLayoutLandscapeWidget extends StatelessWidget {
  const GameLayoutLandscapeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextAndCategoryWidget(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Flexible(flex: 1, child: GameBottomWidget()),
                Flexible(flex: 1, child: GameImageWidget()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
