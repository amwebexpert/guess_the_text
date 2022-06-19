import 'package:flutter/material.dart';
import 'package:guess_the_text/features/game/game.image.widget.dart';
import 'package:guess_the_text/features/game/game.interaction.panel.widget.dart';
import 'package:guess_the_text/features/game/text.and.category.widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

class GameLayoutLandscapeWidget extends StatelessWidget {
  const GameLayoutLandscapeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leftFlexWeight = ResponsiveValue(
      context,
      defaultValue: 1,
      valueWhen: const [Condition.largerThan(name: TABLET, value: 1)],
    ).value!;
    final rightFlexWeight = ResponsiveValue(
      context,
      defaultValue: 1,
      valueWhen: const [Condition.largerThan(name: TABLET, value: 2)],
    ).value!;

    return Row(
      children: <Widget>[
        Flexible(flex: leftFlexWeight, child: const TextAndKeyboardWidget()),
        Flexible(flex: rightFlexWeight, child: const GameImageWidget()),
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
          GameInteractionPanelWidget(),
        ],
      ),
    );
  }
}
