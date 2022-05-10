import 'dart:math';

class Randomizer {
  int nextInt(int max) => Random(DateTime.now().millisecondsSinceEpoch).nextInt(max);
}
