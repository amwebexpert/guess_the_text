// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameStore on GameStoreBase, Store {
  Computed<String>? _$currentStateImgComputed;

  @override
  String get currentStateImg => (_$currentStateImgComputed ??= Computed<String>(
          () => super.currentStateImg,
          name: 'GameStoreBase.currentStateImg'))
      .value;
  Computed<String>? _$gameOverImageComputed;

  @override
  String get gameOverImage =>
      (_$gameOverImageComputed ??= Computed<String>(() => super.gameOverImage,
              name: 'GameStoreBase.gameOverImage'))
          .value;

  late final _$currentCategoryAtom =
      Atom(name: 'GameStoreBase.currentCategory', context: context);

  @override
  ApiCategory get currentCategory {
    _$currentCategoryAtom.reportRead();
    return super.currentCategory;
  }

  @override
  set currentCategory(ApiCategory value) {
    _$currentCategoryAtom.reportWrite(value, super.currentCategory, () {
      super.currentCategory = value;
    });
  }

  late final _$textToGuessAtom =
      Atom(name: 'GameStoreBase.textToGuess', context: context);

  @override
  TextToGuess get textToGuess {
    _$textToGuessAtom.reportRead();
    return super.textToGuess;
  }

  @override
  set textToGuess(TextToGuess value) {
    _$textToGuessAtom.reportWrite(value, super.textToGuess, () {
      super.textToGuess = value;
    });
  }

  late final _$selectCategoryAsyncAction =
      AsyncAction('GameStoreBase.selectCategory', context: context);

  @override
  Future<void> selectCategory(ApiCategory selected) {
    return _$selectCategoryAsyncAction
        .run(() => super.selectCategory(selected));
  }

  late final _$shuffleAsyncAction =
      AsyncAction('GameStoreBase.shuffle', context: context);

  @override
  Future<void> shuffle() {
    return _$shuffleAsyncAction.run(() => super.shuffle());
  }

  late final _$GameStoreBaseActionController =
      ActionController(name: 'GameStoreBase', context: context);

  @override
  void tryLetter(String c) {
    final _$actionInfo = _$GameStoreBaseActionController.startAction(
        name: 'GameStoreBase.tryLetter');
    try {
      return super.tryLetter(c);
    } finally {
      _$GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adhocText(String newText, String categoryName) {
    final _$actionInfo = _$GameStoreBaseActionController.startAction(
        name: 'GameStoreBase.adhocText');
    try {
      return super.adhocText(newText, categoryName);
    } finally {
      _$GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentCategory: ${currentCategory},
textToGuess: ${textToGuess},
currentStateImg: ${currentStateImg},
gameOverImage: ${gameOverImage}
    ''';
  }
}
