import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guess_the_text/features/game/category.widget.dart';
import 'package:guess_the_text/features/game/game.store.dart';
import 'package:guess_the_text/features/game/text_to_guess/text.to.guess.widget.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/store/fixed.delay.spinner.store.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TextAndCategoryWidget extends StatelessWidget {
  const TextAndCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameStore gameStore = serviceLocator.get();
    final FixedDelaySpinnerStore spinnerStore = serviceLocator.get();

    return Observer(builder: (BuildContext context) {
      return ResponsiveRowColumn(
        rowMainAxisAlignment: MainAxisAlignment.spaceAround,
        layout: ResponsiveWrapper.of(context).isSmallerThan(MOBILE)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: TextToGuessWidget(
                text: gameStore.textToGuess.wordGame(), isAnimated: false, isLoading: spinnerStore.isLoading),
          ),
          const ResponsiveRowColumnItem(
            rowFlex: 1,
            child: CategoryWidget(),
          ),
        ],
      );
    });
  }
}
