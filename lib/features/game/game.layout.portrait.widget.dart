import 'package:flutter/material.dart';

import '/features/game/game.image.widget.dart';
import '/features/game/game.interaction.panel.widget.dart';
import '/features/game/text.and.category.widget.dart';

class GameLayoutPortraitWidget extends StatelessWidget {
  const GameLayoutPortraitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Center(
        child: Column(
          children: const <Widget>[
            TextAndCategoryWidget(),
            Expanded(child: GameImageWidget()),
            GameInteractionPanelWidget(),
          ],
        ),
      ),
    );
  }
}
