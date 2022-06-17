import 'package:flutter/material.dart';
import 'package:guess_the_text/features/game/game.image.widget.dart';
import 'package:guess_the_text/features/game/game.interaction.panel.widget.dart';
import 'package:guess_the_text/features/game/text.and.category.widget.dart';

class GameLayoutLandscapeWidget extends StatelessWidget {
  const GameLayoutLandscapeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Flexible(flex: 3, child: TextAndKeyboardWidget()),
        Flexible(flex: 4, child: GameImageWidget()),
      ],
    );
  }
}

class TextAndKeyboardWidget extends StatelessWidget {
  const TextAndKeyboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          TextAndCategoryWidget(),
          GameBottomWidget(),
        ],
      ),
    );
  }
}
