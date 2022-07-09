import '/utils/randomizer.utils.dart';

const Set<String> _animationUniqueNames = {
  '23486-reading-a-book',
  '35235-reading',
  '74586-learning-concept',
  '79960-learning',
  '80356-online-learning',
  '87735-distance-learning',
  '18365-animaton-for-e-learning-web-site',
  '24827-learn',
  '69067-education-blue',
  '79657-child-learning',
  '86671-online-learning',
  '92377-quiz-mode',
  '17793-illustration',
  '26540-blogging-writing-typing',
  '32624-pt-writing-assistant',
  '42293-get-things-done',
  '58305-guestlist',
  '61026-password',
  '74821-blogging-writing-typing-development-activity',
  '81489-writing',
  '86233-man-writing',
};

final List<String> _animationNames = _animationUniqueNames.toList(growable: false);

const _animationsPath = 'assets/animations/loading/';

class AnimationUtils {
  static AnimationUtils? _instance;

  final RandomizerUtils _randomizer;

  factory AnimationUtils(RandomizerUtils randomizer) {
    // assign only if the assigned-to variable is null
    _instance ??= AnimationUtils._privateConstructor(randomizer);

    return _instance!;
  }

  AnimationUtils._privateConstructor(this._randomizer);

  String getAnimationPath() {
    int i = _randomizer.nextInt(_animationNames.length);
    return '$_animationsPath${_animationNames[i]}.json';
  }
}
