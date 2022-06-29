// Mocks generated by Mockito 5.2.0 from annotations
// in guess_the_text/test/features/categories/categories.screen_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i9;

import 'package:flutter/src/widgets/navigator.dart' as _i12;
import 'package:guess_the_text/features/about/api.about.model.dart' as _i3;
import 'package:guess_the_text/features/categories/api.category.model.dart'
    as _i6;
import 'package:guess_the_text/features/game/api.text.model.dart' as _i10;
import 'package:guess_the_text/features/game/api.texts.service.dart' as _i4;
import 'package:guess_the_text/features/game/game.played.items.storage.service.dart'
    as _i5;
import 'package:guess_the_text/features/game/game.store.dart' as _i11;
import 'package:guess_the_text/features/game/text_to_guess/text.to.guess.model.dart'
    as _i7;
import 'package:guess_the_text/services/logger/logger.service.dart' as _i2;
import 'package:mobx/mobx.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeLoggerService_0 extends _i1.Fake implements _i2.LoggerService {}

class _FakeApiAbout_1 extends _i1.Fake implements _i3.ApiAbout {}

class _FakeTextsService_2 extends _i1.Fake implements _i4.TextsService {}

class _FakeGamePlayedItemsStorageService_3 extends _i1.Fake
    implements _i5.GamePlayedItemsStorageService {}

class _FakeApiCategory_4 extends _i1.Fake implements _i6.ApiCategory {}

class _FakeTextToGuess_5 extends _i1.Fake implements _i7.TextToGuess {}

class _FakeReactiveContext_6 extends _i1.Fake implements _i8.ReactiveContext {}

/// A class which mocks [TextsService].
///
/// See the documentation for Mockito's code generation for more information.
class MockTextsService extends _i1.Mock implements _i4.TextsService {
  MockTextsService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.LoggerService get logger =>
      (super.noSuchMethod(Invocation.getter(#logger),
          returnValue: _FakeLoggerService_0()) as _i2.LoggerService);
  @override
  _i9.Future<_i3.ApiAbout> getAboutInfo() =>
      (super.noSuchMethod(Invocation.method(#getAboutInfo, []),
              returnValue: Future<_i3.ApiAbout>.value(_FakeApiAbout_1()))
          as _i9.Future<_i3.ApiAbout>);
  @override
  _i9.Future<List<_i6.ApiCategory>> getCategories() => (super.noSuchMethod(
          Invocation.method(#getCategories, []),
          returnValue: Future<List<_i6.ApiCategory>>.value(<_i6.ApiCategory>[]))
      as _i9.Future<List<_i6.ApiCategory>>);
  @override
  _i9.Future<List<_i10.ApiText>> getTexts(String? categoryUuid) =>
      (super.noSuchMethod(Invocation.method(#getTexts, [categoryUuid]),
              returnValue: Future<List<_i10.ApiText>>.value(<_i10.ApiText>[]))
          as _i9.Future<List<_i10.ApiText>>);
}

/// A class which mocks [GameStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockGameStore extends _i1.Mock implements _i11.GameStore {
  MockGameStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.LoggerService get logger =>
      (super.noSuchMethod(Invocation.getter(#logger),
          returnValue: _FakeLoggerService_0()) as _i2.LoggerService);
  @override
  _i4.TextsService get textsService =>
      (super.noSuchMethod(Invocation.getter(#textsService),
          returnValue: _FakeTextsService_2()) as _i4.TextsService);
  @override
  _i5.GamePlayedItemsStorageService get gamePlayedItemsStorageService =>
      (super.noSuchMethod(Invocation.getter(#gamePlayedItemsStorageService),
              returnValue: _FakeGamePlayedItemsStorageService_3())
          as _i5.GamePlayedItemsStorageService);
  @override
  _i6.ApiCategory get currentCategory =>
      (super.noSuchMethod(Invocation.getter(#currentCategory),
          returnValue: _FakeApiCategory_4()) as _i6.ApiCategory);
  @override
  set currentCategory(_i6.ApiCategory? _currentCategory) =>
      super.noSuchMethod(Invocation.setter(#currentCategory, _currentCategory),
          returnValueForMissingStub: null);
  @override
  _i7.TextToGuess get textToGuess =>
      (super.noSuchMethod(Invocation.getter(#textToGuess),
          returnValue: _FakeTextToGuess_5()) as _i7.TextToGuess);
  @override
  set textToGuess(_i7.TextToGuess? _textToGuess) =>
      super.noSuchMethod(Invocation.setter(#textToGuess, _textToGuess),
          returnValueForMissingStub: null);
  @override
  List<String> get currentCategoryPlayedItems =>
      (super.noSuchMethod(Invocation.getter(#currentCategoryPlayedItems),
          returnValue: <String>[]) as List<String>);
  @override
  set currentCategoryPlayedItems(List<String>? _currentCategoryPlayedItems) =>
      super.noSuchMethod(
          Invocation.setter(
              #currentCategoryPlayedItems, _currentCategoryPlayedItems),
          returnValueForMissingStub: null);
  @override
  String get currentStateImg =>
      (super.noSuchMethod(Invocation.getter(#currentStateImg), returnValue: '')
          as String);
  @override
  String get gameOverImage =>
      (super.noSuchMethod(Invocation.getter(#gameOverImage), returnValue: '')
          as String);
  @override
  _i8.ReactiveContext get context =>
      (super.noSuchMethod(Invocation.getter(#context),
          returnValue: _FakeReactiveContext_6()) as _i8.ReactiveContext);
  @override
  _i9.Future<void> selectCategory(_i6.ApiCategory? selected) =>
      (super.noSuchMethod(Invocation.method(#selectCategory, [selected]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> shuffle() =>
      (super.noSuchMethod(Invocation.method(#shuffle, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> tryLetter(String? c) =>
      (super.noSuchMethod(Invocation.method(#tryLetter, [c]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  void adhocText(String? newText, String? categoryName) =>
      super.noSuchMethod(Invocation.method(#adhocText, [newText, categoryName]),
          returnValueForMissingStub: null);
}

/// A class which mocks [NavigatorObserver].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigatorObserver extends _i1.Mock implements _i12.NavigatorObserver {
  @override
  void didPush(
          _i12.Route<dynamic>? route, _i12.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(Invocation.method(#didPush, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didPop(_i12.Route<dynamic>? route, _i12.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(Invocation.method(#didPop, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didRemove(
          _i12.Route<dynamic>? route, _i12.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(Invocation.method(#didRemove, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didReplace(
          {_i12.Route<dynamic>? newRoute, _i12.Route<dynamic>? oldRoute}) =>
      super.noSuchMethod(
          Invocation.method(
              #didReplace, [], {#newRoute: newRoute, #oldRoute: oldRoute}),
          returnValueForMissingStub: null);
  @override
  void didStartUserGesture(
          _i12.Route<dynamic>? route, _i12.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(
          Invocation.method(#didStartUserGesture, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didStopUserGesture() =>
      super.noSuchMethod(Invocation.method(#didStopUserGesture, []),
          returnValueForMissingStub: null);
}
