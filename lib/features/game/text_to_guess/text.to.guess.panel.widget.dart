import 'package:flutter/material.dart';

class TextToGuessPanel extends StatelessWidget {
  const TextToGuessPanel({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [child],
    );
  }
}
