import 'package:flutter_svg/flutter_svg.dart';

final Set<String> _animationUniqueNames = Set.unmodifiable([
  '23486-reading-a-book',
  '35235-reading',
  '74586-learning-concept',
  '79960-learning',
  '80356-online-learning',
  '87735-distance-learning',
  '18365-animaton-for-e-learning-web-site',
  '24827-learn',
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
]);

final List<String> _animationNames = List.unmodifiable(_animationUniqueNames.toList(growable: false));

class AssetLocatorService {
  static final AssetLocatorService _instance = AssetLocatorService._privateConstructor();

  static const String assetsFolder = 'assets';

  // animation folders
  static const String animationsFolder = '$assetsFolder/animations';
  static const String loadingAnimFolder = '$animationsFolder/loading';

  // image folders
  static const String imagesFolder = '$assetsFolder/images';
  static const String gameImagesFolder = '$imagesFolder/game';
  static const String backgroundImagesFolder = '$imagesFolder/backgrounds';

  factory AssetLocatorService() => _instance;
  AssetLocatorService._privateConstructor();

  String imagePath(String imageName) => '$imagesFolder/$imageName.svg';

  String loadingAnimationPath(String animationName) => '$loadingAnimFolder/$animationName.json';
  List<String> animationNames() => _animationNames;

  // background images
  String backgroundImagePath(String imageName) => '$backgroundImagesFolder/$imageName.jpg';
  String darkBackgroundImagePath() => backgroundImagePath('background-pexels-pixabay-461940');
  String lightBackgroundImagePath() => backgroundImagePath('beach-sun');

  // gaming images
  String gameImagePath(String imageName) => '$gameImagesFolder/$imageName.svg';
  ExactAssetPicture getPicture(String imageName) =>
      ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, gameImagePath(imageName));
}
