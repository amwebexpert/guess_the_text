import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as spinner;
import 'package:guess_the_text/features/game/text_to_guess/text.to.guess.panel.widget.dart';

class TextToGuessShuffling extends StatelessWidget {
  const TextToGuessShuffling({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextToGuessPanel(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: spinner.SpinKitWave(color: Theme.of(context).colorScheme.primary, size: 30),
      ),
    );
  }
}
