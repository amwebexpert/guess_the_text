import 'package:flutter/material.dart';

class TextToGuessTemplate extends StatelessWidget {
  const TextToGuessTemplate({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
