import 'package:flutter_svg/flutter_svg.dart';

class AssetLocatorService {
  static final AssetLocatorService _instance = AssetLocatorService._privateConstructor();

  static const String assetsFolder = 'assets';
  static const String imagesFolder = '$assetsFolder/images';
  static const String gameImagesFolder = '$imagesFolder/game';

  factory AssetLocatorService() => _instance;
  AssetLocatorService._privateConstructor();

  String gameImagePath(String imageName) => '$gameImagesFolder/$imageName.svg';
  ExactAssetPicture getPicture(String imageName) => ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, gameImagePath(imageName));
}
