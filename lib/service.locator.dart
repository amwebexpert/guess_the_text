import 'package:get_it/get_it.dart';
import 'package:guess_the_text/features/game/api_texts.service.dart';
import 'package:guess_the_text/features/game/game.store.dart';
import 'package:guess_the_text/features/game/text.to.guess.ui.store.dart';
import 'package:guess_the_text/services/device/device_info.service.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';
import 'package:guess_the_text/services/storage/shared_preferences.services.dart';
import 'package:guess_the_text/utils/animation.utils.dart';
import 'package:guess_the_text/utils/randomizer.utils.dart';

import 'features/settings/settings.store.dart';

final serviceLocator = GetIt.instance;

Future<GetIt> initServiceLocator() async {
  serviceLocator.registerLazySingleton<LoggerService>(() => LoggerService());

  final sharedPreferencesService = SharedPreferencesService();
  await sharedPreferencesService.init();
  serviceLocator.registerLazySingleton<SharedPreferencesService>(() => sharedPreferencesService);

  serviceLocator.registerLazySingleton<DeviceInfoService>(() => DeviceInfoService());
  serviceLocator.registerLazySingleton<TextsService>(() => TextsService());
  serviceLocator.registerLazySingleton<GameStore>(() => GameStore());
  serviceLocator.registerLazySingleton<TextToGuessUIStore>(() => TextToGuessUIStore());
  serviceLocator.registerLazySingleton<SettingsStore>(() => SettingsStore());

  serviceLocator.registerLazySingleton<RandomizerUtils>(() => RandomizerUtils());
  serviceLocator.registerLazySingleton<AnimationUtils>(() => AnimationUtils(serviceLocator.get<RandomizerUtils>()));

  return serviceLocator;
}
