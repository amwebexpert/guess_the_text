import 'package:flutter/material.dart';

import 'text_to_guess_shuffling.widget.dart';
import 'text_to_guess_with_category.widget.dart';

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
