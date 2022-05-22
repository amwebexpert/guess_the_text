import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guess_the_text/features/game/letter.widget.dart';

void main() {
  const letter = 'B';
  final letterFinder = find.text(letter);
  final buttonFinder = find.byKey(const Key('button_$letter'));

  Widget wrapper(Widget widget) => MaterialApp(home: widget);

  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets("Should show the letter's button", (WidgetTester tester) async {
    // when
    await tester.pumpWidget(wrapper(LetterWidget(
      letter: letter,
      onLetterPressed: (_) {},
      isButtonEnable: true,
    )));

    // then
    expect(letterFinder, findsOneWidget);
    expect(tester.widget<ElevatedButton>(buttonFinder).enabled, true);
  });

  testWidgets('Should call the onPress', (WidgetTester tester) async {
    // given
    var isCallbackCalled = false;

    await tester.pumpWidget(wrapper(LetterWidget(
      letter: letter,
      onLetterPressed: (String label) {
        expect(label, letter);
        isCallbackCalled = true;
      },
      isButtonEnable: true,
    )));

    // when
    await tester.tap(letterFinder, warnIfMissed: true);

    // then
    expect(isCallbackCalled, true);
  });

  testWidgets("Should disable the letter's button", (WidgetTester tester) async {
    // given
    const isButtonEnable = false;

    // when
    await tester.pumpWidget(wrapper(LetterWidget(
      letter: letter,
      onLetterPressed: (_) {},
      isButtonEnable: isButtonEnable,
    )));

    // then
    expect(letterFinder, findsOneWidget);
    expect(tester.widget<ElevatedButton>(buttonFinder).enabled, false);
  });
}
