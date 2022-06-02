// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameStore on _GameStoreBase, Store {
  Computed<String>? _$currentStateImgComputed;

  @override
  String get currentStateImg => (_$currentStateImgComputed ??= Computed<String>(
          () => super.currentStateImg,
          name: '_GameStoreBase.currentStateImg'))
      .value;
  Computed<String>? _$gameOverImageComputed;

  @override
  String get gameOverImage =>
      (_$gameOverImageComputed ??= Computed<String>(() => super.gameOverImage,
              name: '_GameStoreBase.gameOverImage'))
          .value;

  late final _$currentCategoryAtom =
      Atom(name: '_GameStoreBase.currentCategory', context: context);

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
      Atom(name: '_GameStoreBase.textToGuess', context: context);

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

  late final _$currentCategoryPlayedItemsAtom =
      Atom(name: '_GameStoreBase.currentCategoryPlayedItems', context: context);

  @override
  List<String> get currentCategoryPlayedItems {
    _$currentCategoryPlayedItemsAtom.reportRead();
    return super.currentCategoryPlayedItems;
  }

  @override
  set currentCategoryPlayedItems(List<String> value) {
    _$currentCategoryPlayedItemsAtom
        .reportWrite(value, super.currentCategoryPlayedItems, () {
      super.currentCategoryPlayedItems = value;
    });
  }

  late final _$selectCategoryAsyncAction =
      AsyncAction('_GameStoreBase.selectCategory', context: context);

  @override
  Future<void> selectCategory(ApiCategory selected) {
    return _$selectCategoryAsyncAction
        .run(() => super.selectCategory(selected));
  }

  late final _$shuffleAsyncAction =
      AsyncAction('_GameStoreBase.shuffle', context: context);

  @override
  Future<void> shuffle() {
    return _$shuffleAsyncAction.run(() => super.shuffle());
  }

  late final _$tryLetterAsyncAction =
      AsyncAction('_GameStoreBase.tryLetter', context: context);

  @override
  Future<void> tryLetter(String c) {
    return _$tryLetterAsyncAction.run(() => super.tryLetter(c));
  }

  late final _$_GameStoreBaseActionController =
      ActionController(name: '_GameStoreBase', context: context);

  @override
  void adhocText(String newText, String categoryName) {
    final _$actionInfo = _$_GameStoreBaseActionController.startAction(
        name: '_GameStoreBase.adhocText');
    try {
      return super.adhocText(newText, categoryName);
    } finally {
      _$_GameStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentCategory: ${currentCategory},
textToGuess: ${textToGuess},
currentCategoryPlayedItems: ${currentCategoryPlayedItems},
currentStateImg: ${currentStateImg},
gameOverImage: ${gameOverImage}
    ''';
  }
}
