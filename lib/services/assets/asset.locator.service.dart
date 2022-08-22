import 'package:flutter_svg/flutter_svg.dart';

class AssetLocatorService {
  static final AssetLocatorService _instance = AssetLocatorService._privateConstructor();

  static const String assetsFolder = 'assets';

  // image folders
  static const String imagesFolder = '$assetsFolder/images';
  static const String gameImagesFolder = '$imagesFolder/game';
  static const String backgroundImagesFolder = '$imagesFolder/backgrounds';

  factory AssetLocatorService() => _instance;
  AssetLocatorService._privateConstructor();

  // background images
  String backgroundImagePath(String imageName) => '$backgroundImagesFolder/$imageName.jpg';
  String darkBackgroundImagePath() => backgroundImagePath('background-pexels-pixabay-461940');
  String lightBackgroundImagePath() => backgroundImagePath('beach-sun');

  // gaming images
  String gameImagePath(String imageName) => '$gameImagesFolder/$imageName.svg';
  ExactAssetPicture getPicture(String imageName) =>
      ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, gameImagePath(imageName));
}
