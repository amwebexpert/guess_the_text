import 'package:get_it/get_it.dart';
import 'package:guess_the_text/features/game/game.played.items.storage.service.dart';
import 'package:guess_the_text/features/game/game.store.dart';
import 'package:guess_the_text/features/settings/settings.store.dart';
import 'package:guess_the_text/services/device/device.info.service.dart';
import 'package:guess_the_text/services/file/file.service.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';
import 'package:guess_the_text/services/qr/qr.code.service.dart';
import 'package:guess_the_text/services/storage/documents.repository.dart';
import 'package:guess_the_text/services/storage/shared.preferences.services.dart';
import 'package:guess_the_text/services/text.service/api.texts.service.dart';
import 'package:guess_the_text/services/text.service/sql.db.service.dart';
import 'package:guess_the_text/store/fixed.delay.spinner.store.dart';
import 'package:guess_the_text/utils/animation.utils.dart';
import 'package:guess_the_text/utils/randomizer.utils.dart';

final serviceLocator = GetIt.instance;

Future<GetIt> initServiceLocator() async {
  serviceLocator
    ..registerLazySingleton<LoggerService>(() => LoggerService())
    ..registerLazySingleton<FileService>(() => FileService());

  final sharedPreferencesService = SharedPreferencesService();
  await sharedPreferencesService.init();
  serviceLocator.registerSingleton<SharedPreferencesService>(sharedPreferencesService);

  final documentsRepository = DocumentsRepository();
  await documentsRepository.init();
  serviceLocator.registerSingleton<DocumentsRepository>(documentsRepository);

  final gameStorageService = GamePlayedItemsStorageService();
  await gameStorageService.init();

  final sqlDbService = await SqlDbService().init();

  serviceLocator
    ..registerSingleton<GamePlayedItemsStorageService>(gameStorageService)
    ..registerSingleton<SqlDbService>(sqlDbService)
    ..registerLazySingleton<DeviceInfoService>(() => DeviceInfoService())
    ..registerLazySingleton<TextsService>(() => TextsService())
    ..registerLazySingleton<GameStore>(() => GameStore())
    ..registerLazySingleton<FixedDelaySpinnerStore>(() => FixedDelaySpinnerStore())
    ..registerLazySingleton<SettingsStore>(() => SettingsStore())
    ..registerLazySingleton<QrCodeService>(() => QrCodeService())
    ..registerLazySingleton<RandomizerUtils>(() => RandomizerUtils())
    ..registerLazySingleton<AnimationUtils>(() => AnimationUtils(serviceLocator.get<RandomizerUtils>()));

  return serviceLocator;
}
