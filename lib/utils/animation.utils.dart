import '/utils/randomizer.utils.dart';
import '../services/assets/asset.locator.service.dart';

class AnimationUtils {
  static AnimationUtils? _instance;

  final RandomizerUtils _randomizer;
  final AssetLocatorService assetLocatorService = AssetLocatorService();
  late final List<String> animationNames;

  factory AnimationUtils(RandomizerUtils randomizer) {
    // assign only if the assigned-to variable is null
    _instance ??= AnimationUtils._privateConstructor(randomizer);

    return _instance!;
  }

  AnimationUtils._privateConstructor(this._randomizer) {
    animationNames = assetLocatorService.animationNames();
  }

  String getAnimationPath() {
    int i = _randomizer.nextInt(animationNames.length);
    return assetLocatorService.loadingAnimationPath(animationNames[i]);
  }
}
