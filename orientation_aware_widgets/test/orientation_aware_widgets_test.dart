import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:orientation_aware_widgets/orientation_aware_widgets.dart';

void main() {
  final buttonFinder = find.byIcon(Icons.save_alt);

  Widget wrapper(Widget widget) => MaterialApp(home: widget);

  testWidgets('Should call the onTap', (WidgetTester tester) async {
    // given
    int lastIndex = -1;
    final items = [
      NavigationChoices(text: 'Cloud', icon: const Icon(Icons.cloud)),
      NavigationChoices(text: 'Device', icon: const Icon(Icons.save_alt)),
    ];

    await tester.pumpWidget(wrapper(ResponsiveNavigationRailOrBar(
        items: items,
        currentIndex: 0,
        onTap: (i) => {lastIndex = i},
        child: const Text('visible content'))));

    // when
    await tester.tap(buttonFinder, warnIfMissed: true);
    await tester
        .pumpAndSettle(); // wait for all the animations end and then pump the frames

    // then
    expect(lastIndex, 1);
  });
}
