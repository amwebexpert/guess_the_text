import 'package:flutter/material.dart';

class LetterWidget extends StatelessWidget {
  final void Function(String c) onLetterPressed;
  final String letter;
  final bool isButtonEnable;

  const LetterWidget({Key? key, required this.letter, required this.isButtonEnable, required this.onLetterPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: Key('button_$letter'),
      onPressed: isButtonEnable ? () => onLetterPressed(letter) : null,
      child: Text(
        letter,
        style: Theme.of(context).textTheme.bodyText1?.apply(color: Colors.white),
      ),
    );
  }
}
