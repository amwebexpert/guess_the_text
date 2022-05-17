import 'dart:math';

class RandomizerUtils {
  static final RandomizerUtils _instance = RandomizerUtils._privateConstructor();

  factory RandomizerUtils() => _instance;

  RandomizerUtils._privateConstructor();

  int nextInt(int max) => Random(DateTime.now().millisecondsSinceEpoch).nextInt(max);
}
