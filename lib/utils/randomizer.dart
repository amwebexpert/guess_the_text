import 'dart:math';

class Randomizer {
  static final Randomizer _instance = Randomizer._privateConstructor();

  factory Randomizer() => _instance;

  Randomizer._privateConstructor();

  int nextInt(int max) => Random(DateTime.now().millisecondsSinceEpoch).nextInt(max);
}
