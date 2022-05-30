import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast/sembast.dart';

import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';

class GameStorageService {
  static final GameStorageService _instance = GameStorageService._privateConstructor();

  final LoggerService logger = serviceLocator.get();
  late final Database db;
  late final StoreRef<String, List<Object?>> playedItemsStore;

  factory GameStorageService() => _instance;
  GameStorageService._privateConstructor();

  Future<void> init() async {
    final dbPath = await _getDbFullPath();
    logger.info('GameStorageService init: $dbPath');

    db = await databaseFactoryIo.openDatabase(dbPath);
    playedItemsStore = StoreRef('played_items_store');

    // Examples
    playedItemsStore.record('expressions françaises').put(db, ['déjà vu', 'mélange bonheur']);
    playedItemsStore
        .record('english expressions')
        .put(db, ['already seen', 'mixed happiness', 'Been there, done that', 'Never mind']);

    var record = await playedItemsStore.record('expressions françaises').getSnapshot(db);
    logger.info('GameStorageService test conclusion: $record');
    record = await playedItemsStore.record('english expressions').getSnapshot(db);
    logger.info('GameStorageService test conclusion 2: ${record?.value}');
  }

  Future<String> _getDbFullPath() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    return join(dir.path, 'game_storage.db');
  }
}
