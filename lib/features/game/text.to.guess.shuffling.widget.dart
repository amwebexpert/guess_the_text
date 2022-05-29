import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as spinner;

class TextToGuessShuffling extends StatelessWidget {
  const TextToGuessShuffling({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: spinner.SpinKitWave(color: Theme.of(context).colorScheme.primary, size: 30),
    );
  }
}
