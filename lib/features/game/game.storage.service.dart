import 'dart:async';

import 'package:guess_the_text/documents.repository.dart';
import 'package:sembast/sembast.dart';

import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';

class GameStorageService {
  static final GameStorageService _instance = GameStorageService._privateConstructor();

  final LoggerService logger = serviceLocator.get();
  final Database db = serviceLocator.get<DocumentsRepository>().db;

  // implementation note: a Set<String> instead of a List<Object> would have been better here, but it is not (yet) supported by Sembast
  late final StoreRef<String, List<Object?>> playedItemsStore;

  factory GameStorageService() => _instance;
  GameStorageService._privateConstructor();

  Future<void> init() async {
    playedItemsStore = StoreRef('played_items_store');
    final count = await playedItemsStore.count(db);
    logger.info('GameStorageService contains: $count categories');
    await clearPlayedItemsStore();
    final count2 = await playedItemsStore.count(db);
    logger.info('GameStorageService contains: $count2 categories');

    // Examples
    await addPlayedItem('expressions françaises', 'déjà vue');
    await addPlayedItem('expressions françaises', 'mélange bonheur');
    await addPlayedItems(
        'english expressions', ['already seen', 'mixed happiness', 'Been there, done that', 'Never mind']);

    var elements = await getPlayedItems('expressions françaises');
    logger.info('GameStorageService elements: $elements');

    var elements2 = await getPlayedItems('english expressions');
    logger.info('GameStorageService english expressions: $elements2');
  }

  Future<void> addPlayedItems(String categoryUuid, List<String> newItems) async {
    final record = playedItemsStore.record(categoryUuid);
    final List existingItems = (await record.get(db) ?? []);
    final List items = existingItems.toSet().toList();
    items.addAll(newItems);

    await record.put(db, items);
  }

  Future<void> addPlayedItem(String categoryUuid, String item) async {
    final record = playedItemsStore.record(categoryUuid);
    final List existingItems = (await record.get(db) ?? []);
    final List items = existingItems.toSet().toList();
    items.add(item);
    await record.put(db, items);
  }

  Future<void> clearPlayedItems(String categoryUuid) async {
    final record = playedItemsStore.record(categoryUuid);
    await record.delete(db);
  }

  Future<List<dynamic>> getPlayedItems(String categoryUuid) async {
    final record = playedItemsStore.record(categoryUuid);
    final List items = (await record.get(db) ?? []);
    return items;
  }

  Future<void> clearPlayedItemsStore() async {
    final count = await playedItemsStore.delete(db);
    logger.info('GameStorageService deleted: $count categories');
  }
}
