import 'package:guess_the_text/model/word_to_guess.model.dart';
import 'package:guess_the_text/features/categories/api_category.model.dart';
import 'package:guess_the_text/features/game/api_text.model.dart';
import 'package:guess_the_text/features/game/api_texts.service.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';
import 'package:guess_the_text/utils/extensions/string.extensions.dart';
import 'package:mobx/mobx.dart';

import 'dart:math';

// Include generated file
part 'game.store.g.dart';

// This is the class used by rest of the codebase
class GameStore extends GameStoreBase with _$GameStore {
  static final GameStore _instance = GameStore._privateConstructor();

  factory GameStore() => _instance;

  GameStore._privateConstructor() : super();
}

// The store-class
abstract class GameStoreBase with Store {
  final LoggerService logger = LoggerService();
  final TextsService textsService = TextsService();

  @observable
  ApiCategory currentCategory = ApiCategory();

  @observable
  TextToGuess textToGuess = TextToGuess();

  GameStoreBase() {
    _initialize();
  }

  Future<void> _initialize() async {
    List<ApiCategory> categories = await textsService.getCategories();
    currentCategory = categories.first;
    await shuffle();
  }

  @action
  Future<void> selectCategory(ApiCategory selected) async {
    // @see also ObservableFuture, see https://mobx.netlify.app/api/action/
    currentCategory = selected;
    await shuffle();
  }

  @action
  Future<void> shuffle() async {
    List<ApiText> texts = await textsService.getTexts(currentCategory.uuid);
    int i = Random(DateTime.now().millisecondsSinceEpoch).nextInt(texts.length);
    ApiText apiText = texts.elementAt(i);
    textToGuess = TextToGuess(characters: apiText.normalized, original: apiText.original);
    logger.info('shuffled text: ${textToGuess.characters}');
  }

  @action
  void tryLetter(String c) {
    textToGuess = textToGuess.tryChar(c: c);
  }

  @action
  void adhocText(String newText, String categoryName) {
    currentCategory = ApiCategory(uuid: 'adhoc', name: categoryName, isCustom: true);
    final normalized = newText.removeDiacritics().toUpperCase();
    textToGuess = TextToGuess(characters: normalized, original: newText);
    logger.info('ADHOC text: ${textToGuess.characters}');
  }

  @computed
  String get currentStateImg => 'assets/images/${textToGuess.currentStateName()}.svg';

  @computed
  String get gameOverImage => 'assets/images/${textToGuess.gameOverConclusionName()}.svg';
}
