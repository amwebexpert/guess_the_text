import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '/features/game/category.widget.dart';
import '/features/game/game.store.dart';
import '/features/game/text_to_guess/text.to.guess.widget.dart';
import '/service.locator.dart';
import '/store/fixed.delay.spinner.store.dart';

class TextAndCategoryWidget extends StatelessWidget {
  const TextAndCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameStore gameStore = serviceLocator.get();
    final FixedDelaySpinnerStore spinnerStore = serviceLocator.get();
    final isColumnLayout = ResponsiveWrapper.of(context).isSmallerThan(MOBILE) ||
        ResponsiveWrapper.of(context).orientation == Orientation.landscape;

    return Observer(builder: (BuildContext context) {
      final text = gameStore.textToGuess.wordGame();

      return ResponsiveRowColumn(
        rowMainAxisAlignment: MainAxisAlignment.spaceAround,
        layout: isColumnLayout ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: TextToGuessWidget(text: text, isAnimated: false, isLoading: spinnerStore.isLoading),
          ),
          const ResponsiveRowColumnItem(rowFlex: 1, child: CategoryWidget()),
        ],
      );
    });
  }
}
