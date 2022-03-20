import 'package:flutter/material.dart';
import 'package:guess_the_text/model/word_to_guess.dart';
import 'package:guess_the_text/screens/game/text_to_guess_template_widget.dart';
import 'package:guess_the_text/services/hangman/hangman_service.dart';

class WordSessionText extends StatelessWidget {
  final TextToGuess textToGuess;

  const WordSessionText({Key? key, required this.textToGuess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return isPortrait
        ? Column(
            children: [
              const CategoryLabel(),
              TextToGuessTemplate(text: textToGuess.wordGame()),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextToGuessTemplate(text: textToGuess.wordGame()),
              const CategoryLabel(),
            ],
          );
  }
}

class CategoryLabel extends StatelessWidget {
  const CategoryLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String categoryName = HangmanService().currentCategoryName();

    return Text(
      categoryName,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
