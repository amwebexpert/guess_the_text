// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

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

  final _$isLoadingAtom = Atom(name: 'GameStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$currentCategoryAtom = Atom(name: 'GameStoreBase.currentCategory');

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

  final _$textToGuessAtom = Atom(name: 'GameStoreBase.textToGuess');

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

  final _$selectCategoryAsyncAction =
      AsyncAction('GameStoreBase.selectCategory');

  @override
  Future<void> selectCategory(ApiCategory selected) {
    return _$selectCategoryAsyncAction
        .run(() => super.selectCategory(selected));
  }

  final _$shuffleAsyncAction = AsyncAction('GameStoreBase.shuffle');

  @override
  Future<void> shuffle() {
    return _$shuffleAsyncAction.run(() => super.shuffle());
  }

  final _$GameStoreBaseActionController =
      ActionController(name: 'GameStoreBase');

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
  String toString() {
    return '''
isLoading: ${isLoading},
currentCategory: ${currentCategory},
textToGuess: ${textToGuess},
currentStateImg: ${currentStateImg},
gameOverImage: ${gameOverImage}
    ''';
  }
}
