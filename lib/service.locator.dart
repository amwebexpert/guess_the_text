import 'package:get_it/get_it.dart';
import 'package:guess_the_text/documents.repository.dart';
import 'package:guess_the_text/features/game/api.texts.service.dart';
import 'package:guess_the_text/features/game/game.played.items.storage.service.dart';
import 'package:guess_the_text/features/game/game.store.dart';
import 'package:guess_the_text/services/device/device.info.service.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';
import 'package:guess_the_text/services/qr/qr.code.service.dart';
import 'package:guess_the_text/services/storage/shared.preferences.services.dart';
import 'package:guess_the_text/store/fixed.delay.spinner.store.dart';
import 'package:guess_the_text/utils/animation.utils.dart';
import 'package:guess_the_text/utils/randomizer.utils.dart';

import 'features/settings/settings.store.dart';

final serviceLocator = GetIt.instance;

Future<GetIt> initServiceLocator() async {
  serviceLocator.registerLazySingleton<LoggerService>(() => LoggerService());

  final sharedPreferencesService = SharedPreferencesService();
  await sharedPreferencesService.init();
  serviceLocator.registerSingleton<SharedPreferencesService>(sharedPreferencesService);

  final documentsRepository = DocumentsRepository();
  await documentsRepository.init();
  serviceLocator.registerSingleton<DocumentsRepository>(documentsRepository);

  final gameStorageService = GamePlayedItemsStorageService();
  await gameStorageService.init();
  serviceLocator.registerSingleton<GamePlayedItemsStorageService>(gameStorageService);

  serviceLocator.registerLazySingleton<DeviceInfoService>(() => DeviceInfoService());
  serviceLocator.registerLazySingleton<TextsService>(() => TextsService());
  serviceLocator.registerLazySingleton<GameStore>(() => GameStore());
  serviceLocator.registerLazySingleton<FixedDelaySpinnerStore>(() => FixedDelaySpinnerStore());
  serviceLocator.registerLazySingleton<SettingsStore>(() => SettingsStore());

  serviceLocator.registerLazySingleton<QrCodeService>(() => QrCodeService());

  serviceLocator.registerLazySingleton<RandomizerUtils>(() => RandomizerUtils());
  serviceLocator.registerLazySingleton<AnimationUtils>(() => AnimationUtils(serviceLocator.get<RandomizerUtils>()));

  return serviceLocator;
}
