import 'package:flutter/material.dart';

import '/features/game/text_to_guess/text.to.guess.animating.widget.dart';
import '/features/game/text_to_guess/text.to.guess.panel.widget.dart';
import '/features/game/text_to_guess/text.to.guess.shuffling.widget.dart';
import '/theme/app.theme.dart';

class TextToGuessWidget extends StatelessWidget {
  const TextToGuessWidget({Key? key, required this.text, required this.isAnimated, required this.isLoading})
      : super(key: key);

  final String text;
  final bool isAnimated;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const TextToGuessShuffling();
    }

    final textStyle = TextStyle(
      fontSize: 36,
      fontFamily: appFontFamily,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
      color: Theme.of(context).colorScheme.primary,
    );

    return isAnimated
        ? TextToGuessAnimating(text: text, style: textStyle)
        : TextToGuessPanel(
            child: Text(
            text,
            style: textStyle,
            textAlign: TextAlign.center,
          ));
  }
}
