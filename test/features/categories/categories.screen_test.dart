import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guess_the_text/features/categories/categories.screen.dart';
import 'package:guess_the_text/features/game/api_texts.service.dart';
import 'package:guess_the_text/features/game/game.store.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/categories.mocks.dart';
import 'categories.screen_test.mocks.dart';

// Annotation which generates the *.mocks.dart library and the Mock classes
@GenerateMocks([TextsService, GameStore])
void main() {
  final mockTextsService = MockTextsService();
  final mockGameStore = MockGameStore();

  final mockCategories = [mockAnimalCategory, mockTransportCategory];
  final spinnerFinder = find.byKey(const Key('categories_loading'));

  Widget wrapper(Widget widget) => MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),
      home: widget);

  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('Should toggle the loading spinner', (WidgetTester tester) async {
    // given
    when(mockTextsService.getCategories()).thenAnswer((_) => Future.value(mockCategories));

    // when
    await tester.pumpWidget(wrapper(CategoriesWidget(textsService: mockTextsService, gameStore: mockGameStore)));

    // then
    expect(spinnerFinder, findsOneWidget);

    // when
    await tester.pump();

    // then
    expect(spinnerFinder, findsNothing);
  });

  testWidgets('Should display the categories', (WidgetTester tester) async {
    // given
    when(mockTextsService.getCategories()).thenAnswer((_) => Future.value(mockCategories));

    // when
    await tester.pumpWidget(wrapper(CategoriesWidget(textsService: mockTextsService, gameStore: mockGameStore)));
    await tester.pump(); // wait for the spinner to disappear

    // then
    expect(find.text(mockAnimalCategory.name), findsOneWidget);
    expect(find.text(mockTransportCategory.name), findsOneWidget);
  });
}
