import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '/features/game/text_to_guess/text.to.guess.panel.widget.dart';

class TextToGuessAnimating extends StatelessWidget {
  const TextToGuessAnimating({Key? key, required this.text, required this.style}) : super(key: key);

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return TextToGuessPanel(
      child: DefaultTextStyle(
        style: style,
        textAlign: TextAlign.center,
        child: AnimatedTextKit(
          animatedTexts: [WavyAnimatedText(text)],
          isRepeatingAnimation: true,
        ),
      ),
    );
  }
}
