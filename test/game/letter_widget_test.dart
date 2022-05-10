import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guess_the_text/model/word_to_guess.dart';
import 'package:guess_the_text/screens/game/letter_widget.dart';

void main() {
  Widget wrapper(Widget widget) => MaterialApp(home: widget);

  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets("Should show the letter's button", (WidgetTester tester) async {
    // given
    const letter = 'B';
    final letterFinder = find.text(letter);

    // when
    await tester.pumpWidget(wrapper(LetterWidget(
      letter: letter,
      onLetterPressed: (_) {},
      textToGuess: TextToGuess(characters: 'Hello', original: 'Hello'),
    )));

    // then
    expect(letterFinder, findsOneWidget);
  });
}
