import 'dart:math';

const List<String> animationNames = [
  '23486-reading-a-book',
  '35235-reading',
  '74586-learning-concept',
  '79960-learning',
  '80356-online-learning',
  '87735-distance-learning'
];

const animationsPath = 'assets/animations/loading/';

String getAnimationPath() {
  int i = Random(DateTime.now().millisecondsSinceEpoch).nextInt(animationNames.length);
  return animationsPath + animationNames[i] + '.json';
}
