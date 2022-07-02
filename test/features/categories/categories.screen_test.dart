import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import '/features/categories/categories.screen.dart';
import '/features/game/api.texts.service.dart';
import '/features/game/game.store.dart';
import '/utils/animation.utils.dart';
import '/utils/randomizer.utils.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/categories.mocks.dart';
import 'categories.screen_test.mocks.dart';

// Annotation which generates the *.mocks.dart library and the Mock classes
@GenerateMocks(
  [TextsService, GameStore],
  customMocks: [
    MockSpec<NavigatorObserver>(
      returnNullOnMissingStub: true,
    )
  ],
)
void main() {
  final mockTextsService = MockTextsService();
  final mockGameStore = MockGameStore();
  final mockNavigatorObserver = MockNavigatorObserver();

  setUpAll(() {
    GetIt.I.registerSingleton<TextsService>(mockTextsService);
    GetIt.I.registerSingleton<GameStore>(mockGameStore);
    GetIt.I.registerSingleton<AnimationUtils>(AnimationUtils(RandomizerUtils()));
  });

  tearDownAll(() => {
        GetIt.I.reset(),
      });

  final mockCategories = [
    mockAnimalsCategory,
    mockTransportsCategory,
    mockColorsCategory,
    mockUSStatesCategory,
    mockPlanetsCategory,
    mockCountriesCategory
  ];
  final spinnerFinder = find.byKey(const Key('categories_loading'));

  Widget wrapper(Widget widget) => MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),
      navigatorObservers: [mockNavigatorObserver],
      home: widget);

  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('Should toggle the loading spinner', (WidgetTester tester) async {
    // given
    when(mockTextsService.getCategories()).thenAnswer((_) => Future.value(mockCategories));

    // when
    await tester.pumpWidget(wrapper(const CategoriesWidget()));

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
    await tester.pumpWidget(wrapper(const CategoriesWidget()));
    await tester.pump(); // wait for the spinner to disappear

    // then
    expect(find.text(mockAnimalsCategory.name), findsOneWidget);
    expect(find.text(mockTransportsCategory.name), findsOneWidget);
    expect(find.text(mockColorsCategory.name), findsOneWidget);
    expect(find.text(mockUSStatesCategory.name), findsOneWidget);
    expect(find.text(mockPlanetsCategory.name), findsOneWidget);
    expect(find.text(mockCountriesCategory.name), findsOneWidget);
  });

  testWidgets('Should handle the user choice on press', (WidgetTester tester) async {
    // given
    when(mockTextsService.getCategories()).thenAnswer((_) => Future.value(mockCategories));
    when(mockGameStore.selectCategory(any)).thenAnswer((_) => Future.value(null));

    // asserts before acting
    await tester.pumpWidget(wrapper(const CategoriesWidget()));
    await tester.pump(); // wait for the spinner to disappear

    // when
    verifyNever(mockGameStore.selectCategory(mockAnimalsCategory));

    await tester.tap(find.text(mockAnimalsCategory.name));
    await tester.pump(); // wait for the animation to finish

    // then
    verify(mockGameStore.selectCategory(mockAnimalsCategory)).called(1);
  });

  testWidgets('Should navigate back on press', (WidgetTester tester) async {
    // given
    when(mockTextsService.getCategories()).thenAnswer((_) => Future.value(mockCategories));
    when(mockGameStore.selectCategory(any)).thenAnswer((_) => Future.value(null));
    reset(mockNavigatorObserver);

    // asserts before acting
    await tester.pumpWidget(wrapper(const CategoriesWidget()));
    await tester.pump(); // wait for the spinner to disappear

    // when
    await tester.tap(find.text(mockTransportsCategory.name));
    await tester.pump(); // wait for the animation to finish

    // then
    verify(mockNavigatorObserver.didPop(argThat(isNotNull), any)).called(1);
  });
}
