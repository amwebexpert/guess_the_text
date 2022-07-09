import '/utils/randomizer.utils.dart';

const List<String> animationNames = [
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
  '17793-illustration.json',
  '26540-blogging-writing-typing.json',
  '32624-pt-writing-assistant.json',
  '42293-get-things-done.json',
  '58305-guestlist.json',
  '61026-password.json',
  '73984-girl-studying-on-laptop.json',
  '74821-blogging-writing-typing-development-activity.json',
  '81489-writing.json',
  '86233-man-writing.json',
];

const animationsPath = 'assets/animations/loading/';

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
    int i = _randomizer.nextInt(animationNames.length);
    return '$animationsPath${animationNames[i]}.json';
  }
}
