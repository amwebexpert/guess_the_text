import 'package:get_it/get_it.dart';

import 'features/game/game.played.items.storage.service.dart';
import 'features/game/game.store.dart';
import 'features/settings/settings.store.dart';
import 'services/device/device.info.service.dart';
import 'services/file/file.service.dart';
import 'services/logger/logger.service.dart';
import 'services/qr/qr.code.service.dart';
import 'services/storage/documents.repository.dart';
import 'services/storage/shared.preferences.services.dart';
import 'services/text.service/api.texts.service.dart';
import 'services/text.service/sql.db.service.dart';
import 'store/fixed.delay.spinner.store.dart';
import 'utils/animation.utils.dart';
import 'utils/randomizer.utils.dart';

final serviceLocator = GetIt.instance;

Future<GetIt> initServiceLocator() async {
  serviceLocator
    ..registerSingleton<LoggerService>(LoggerService())
    ..registerSingleton<FileService>(FileService())
    ..registerSingleton<SharedPreferencesService>(await SharedPreferencesService().init())
    ..registerSingleton<DocumentsRepository>(await DocumentsRepository().init())
    ..registerSingleton<GamePlayedItemsStorageService>(await GamePlayedItemsStorageService().init())
    ..registerLazySingleton<DeviceInfoService>(() => DeviceInfoService())
    ..registerLazySingleton<TextsService>(() => TextsService())
    ..registerLazySingleton<GameStore>(() => GameStore())
    ..registerLazySingleton<FixedDelaySpinnerStore>(() => FixedDelaySpinnerStore())
    ..registerLazySingleton<SettingsStore>(() => SettingsStore())
    ..registerLazySingleton<QrCodeService>(() => QrCodeService())
    ..registerLazySingleton<RandomizerUtils>(() => RandomizerUtils())
    ..registerLazySingleton<AnimationUtils>(() => AnimationUtils(serviceLocator.get<RandomizerUtils>()));

  // service not supported by all platforms
  final sqlDbService = await SqlDbService().init();
  if (sqlDbService != null) {
    serviceLocator.registerSingleton<SqlDbService>(sqlDbService);
  }

  return serviceLocator;
}
