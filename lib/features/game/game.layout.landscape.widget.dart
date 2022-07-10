import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '/features/game/game.image.widget.dart';
import '/features/game/game.interaction.panel.widget.dart';
import '/features/game/text.and.category.widget.dart';
import '/theme/theme.utils.dart';

class GameLayoutLandscapeWidget extends StatelessWidget {
  const GameLayoutLandscapeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rightFlexWeight = ResponsiveValue(
      context,
      defaultValue: 1,
      valueWhen: const [Condition.largerThan(name: TABLET, value: 2)],
    ).value!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacing(1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Flexible(flex: 1, fit: FlexFit.tight, child: TextAndKeyboardWidget()),
          Flexible(flex: rightFlexWeight, fit: FlexFit.tight, child: const GameImageWidget()),
        ],
      ),
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
          GameInteractionPanelWidget(),
        ],
      ),
    );
  }
}
