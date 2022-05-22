// Mocks generated by Mockito 5.1.0 from annotations
// in guess_the_text/test/features/categories/categories.screen_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;

import 'package:guess_the_text/features/about/api_about.model.dart' as _i3;
import 'package:guess_the_text/features/categories/api_category.model.dart'
    as _i5;
import 'package:guess_the_text/features/game/api_text.model.dart' as _i8;
import 'package:guess_the_text/features/game/api_texts.service.dart' as _i4;
import 'package:guess_the_text/features/game/game.store.dart' as _i9;
import 'package:guess_the_text/features/game/text_to_guess.model.dart' as _i6;
import 'package:guess_the_text/services/logger/logger.service.dart' as _i2;
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

class _FakeApiCategory_3 extends _i1.Fake implements _i5.ApiCategory {}

class _FakeTextToGuess_4 extends _i1.Fake implements _i6.TextToGuess {}

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
  _i7.Future<_i3.ApiAbout> getAboutInfo() =>
      (super.noSuchMethod(Invocation.method(#getAboutInfo, []),
              returnValue: Future<_i3.ApiAbout>.value(_FakeApiAbout_1()))
          as _i7.Future<_i3.ApiAbout>);
  @override
  _i7.Future<List<_i5.ApiCategory>> getCategories() => (super.noSuchMethod(
          Invocation.method(#getCategories, []),
          returnValue: Future<List<_i5.ApiCategory>>.value(<_i5.ApiCategory>[]))
      as _i7.Future<List<_i5.ApiCategory>>);
  @override
  _i7.Future<List<_i8.ApiText>> getTexts(String? categoryUuid) =>
      (super.noSuchMethod(Invocation.method(#getTexts, [categoryUuid]),
              returnValue: Future<List<_i8.ApiText>>.value(<_i8.ApiText>[]))
          as _i7.Future<List<_i8.ApiText>>);
}

/// A class which mocks [GameStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockGameStore extends _i1.Mock implements _i9.GameStore {
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
  _i5.ApiCategory get currentCategory =>
      (super.noSuchMethod(Invocation.getter(#currentCategory),
          returnValue: _FakeApiCategory_3()) as _i5.ApiCategory);
  @override
  set currentCategory(_i5.ApiCategory? _currentCategory) =>
      super.noSuchMethod(Invocation.setter(#currentCategory, _currentCategory),
          returnValueForMissingStub: null);
  @override
  _i6.TextToGuess get textToGuess =>
      (super.noSuchMethod(Invocation.getter(#textToGuess),
          returnValue: _FakeTextToGuess_4()) as _i6.TextToGuess);
  @override
  set textToGuess(_i6.TextToGuess? _textToGuess) =>
      super.noSuchMethod(Invocation.setter(#textToGuess, _textToGuess),
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
  _i7.Future<void> selectCategory(_i5.ApiCategory? selected) =>
      (super.noSuchMethod(Invocation.method(#selectCategory, [selected]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> shuffle() =>
      (super.noSuchMethod(Invocation.method(#shuffle, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  void tryLetter(String? c) =>
      super.noSuchMethod(Invocation.method(#tryLetter, [c]),
          returnValueForMissingStub: null);
  @override
  void adhocText(String? newText, String? categoryName) =>
      super.noSuchMethod(Invocation.method(#adhocText, [newText, categoryName]),
          returnValueForMissingStub: null);
}
