import 'dart:async';

import 'package:sembast/sembast.dart';

import '/documents.repository.dart';
import '/service.locator.dart';
import '/services/logger/logger.service.dart';

class GamePlayedItemsStorageService {
  static final GamePlayedItemsStorageService _instance = GamePlayedItemsStorageService._privateConstructor();

  final LoggerService logger = serviceLocator.get();
  final Database db = serviceLocator.get<DocumentsRepository>().db;

  // implementation note: a Set<String> instead of a List<Object> would have been better here, but it is not (yet) supported by Sembast
  late final StoreRef<String, List<Object?>> playedItemsStore;

  factory GamePlayedItemsStorageService() => _instance;
  GamePlayedItemsStorageService._privateConstructor();

  Future<void> init() async {
    playedItemsStore = StoreRef('played_items_store');
    final count = await playedItemsStore.count(db);
    logger.info('Storage "${playedItemsStore.name}" elements count: $count.');
  }

  Future<List<String>> addPlayedItems(String categoryUuid, List<String> newItems) async {
    final record = playedItemsStore.record(categoryUuid);
    final List existingItems = (await record.get(db) ?? []);
    final List items = existingItems.toSet().toList();
    items.addAll(newItems);

    await record.put(db, items);
    return items.map((e) => e.toString()).toList();
  }

  Future<List<String>> addPlayedItem(String categoryUuid, String item) async {
    final record = playedItemsStore.record(categoryUuid);
    final List existingItems = (await record.get(db) ?? []);
    final List items = existingItems.toSet().toList();
    items.add(item);
    await record.put(db, items);

    return items.map((e) => e.toString()).toList();
  }

  Future<List<String>> getPlayedItems(String categoryUuid) async {
    final record = playedItemsStore.record(categoryUuid);
    final List items = (await record.get(db) ?? []);
    return items.map((e) => e.toString()).toList();
  }

  Future<void> clearCategoryPlayedItems(String categoryUuid) async {
    final record = playedItemsStore.record(categoryUuid);
    await record.delete(db);
  }

  Future<void> clearAllPlayedItems() async {
    final count = await playedItemsStore.delete(db);
    logger.info('Removing: $count categories');
  }
}
