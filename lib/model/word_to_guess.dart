class TextToGuess {
  static const String stateName = 'hangman';
  static const int maxTrials = 10;
  final String characters;
  final String original;

  late List<String> chars;
  List<String> charsTried = [];
  int badTrialCount = 0;

  TextToGuess({required this.characters, required this.original}) {
    chars = characters.split('');
  }

  bool tryChar({required String c}) {
    if (!charsTried.contains(c)) {
      charsTried.add(c);
    }

    bool ok = chars.contains(c);
    if (!ok) {
      badTrialCount++;
    }

    return ok;
  }

  String currentStateImage() {
    int stateNumber = badTrialCount + 1;
    if (stateNumber > maxTrials) {
      stateNumber = maxTrials;
    }

    String stateNumberPadded = "$stateNumber".padLeft(2, '0');
    return "$stateName-$stateNumberPadded";
  }

  String gameOverImage() {
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
