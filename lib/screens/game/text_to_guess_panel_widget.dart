import 'package:flutter/material.dart';
import 'package:guess_the_text/screens/game/text_to_guess_shuffling_widget.dart';
import 'package:guess_the_text/screens/game/text_to_guess_with_category_widget.dart';

class TextToGuessArea extends StatelessWidget {
  final bool isLoading;
  const TextToGuessArea({Key? key, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const TextToGuessShuffling();
    }

    return const TextToGuessWithCategory();
  }
}
