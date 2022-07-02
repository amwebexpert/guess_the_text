import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('when user presses "A" button', () {
    const letterA = 'A';
    final letterAFinder = find.text(letterA);
    final buttonFinder = find.byKey(const Key('button_$letterA'));

    testWidgets('it should disabled the button', (WidgetTester tester) async {
      // given
      app.main();
      await tester.pumpAndSettle();

      expect(letterAFinder, findsOneWidget);
      expect(tester.widget<ElevatedButton>(buttonFinder).enabled, true);

      // when
      await tester.tap(letterAFinder);
      await tester.pumpAndSettle(); // trigger a frame

      // then
      expect(tester.widget<ElevatedButton>(buttonFinder).enabled, false);

      // when
      await tester.tap(find.byTooltip('Shuffle'));
      await tester.pumpAndSettle();

      // then
      expect(tester.widget<ElevatedButton>(buttonFinder).enabled, true);
    });
  });
}
