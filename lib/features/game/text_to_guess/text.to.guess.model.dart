class TextToGuess {
  static const String stateName = 'hangman';
  static const int maxTrials = 10;
  final String characters;
  final String original;

  late final List<String> chars;
  List<String> charsTried = [];
  int badTrialCount = 0;

  TextToGuess({this.characters = '', this.original = ''}) {
    chars = characters.split('');
  }

  factory TextToGuess.from(TextToGuess original) {
    TextToGuess clone = TextToGuess(characters: original.characters, original: original.original);

    clone.charsTried = original.charsTried;
    clone.badTrialCount = original.badTrialCount;

    return clone;
  }

  TextToGuess tryChar({required String c}) {
    TextToGuess mutation = TextToGuess.from(this);

    if (!mutation.charsTried.contains(c)) {
      mutation.charsTried.add(c);
    }

    if (!mutation.chars.contains(c)) {
      mutation.badTrialCount++;
    }

    return mutation;
  }

  String get welcomeState => '$stateName-happy';

  String currentStateName() {
    int stateNumber = badTrialCount + 1;
    if (stateNumber > maxTrials) {
      stateNumber = maxTrials;
    }

    String stateNumberPadded = '$stateNumber'.padLeft(2, '0');
    return '$stateName-$stateNumberPadded';
  }

  bool isCharTried(String c) {
    return charsTried.contains(c);
  }

  String gameOverConclusionName() {
    return isGameOverWithSuccess() ? 'success' : 'fail';
  }

  bool isGameOver() {
    return isGameOverWithFailure() || isGameOverWithSuccess();
  }

  bool isGameOverWithFailure() {
    return badTrialCount >= maxTrials - 1;
  }

  bool isGameOverWithSuccess() {
    return !wordGame().contains('_');
  }

  String wordGame() {
    List<String> wordGame = characters.split('');

    for (var i = 0; i < wordGame.length; i++) {
      String c = wordGame[i];
      if (!charsTried.contains(c)) {
        wordGame[i] = '_';
      }
    }

    return wordGame.join('');
  }
}
