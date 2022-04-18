import 'dart:math';

const List<String> animationNames = [
  '23486-reading-a-book',
  '35235-reading',
  '74586-learning-concept',
  '79960-learning',
  '80356-online-learning',
  '87735-distance-learning',
  '18365-animaton-for-e-learning-web-site',
  '19857-learn-more-about-something',
  '24827-learn',
  '69067-education-blue',
  '79657-child-learning',
  '86671-online-learning',
  '87613-education2',
  '91178-easy-to-learn',
  '92377-quiz-mode',
];

const animationsPath = 'assets/animations/loading/';

String getAnimationPath() {
  int i = Random(DateTime.now().millisecondsSinceEpoch).nextInt(animationNames.length);
  return animationsPath + animationNames[i] + '.json';
}
