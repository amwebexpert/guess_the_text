import 'dart:async';

import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/services/file/directory.enum.dart';
import 'package:guess_the_text/services/file/file.service.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';
import 'package:guess_the_text/services/text.service/api.category.model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

enum TableNames { category, text }

enum CategoryColumns { id, uuid, langcode, name, iconname }

class SqlDbService {
  final LoggerService logger = serviceLocator.get();
  final FileService fileService = serviceLocator.get();

  static final SqlDbService _instance = SqlDbService._privateConstructor();
  Database? _db;
  final version = 1;

  final _createTableCategory = '''
    CREATE TABLE ${TableNames.category.name} (
      ${CategoryColumns.id.name} INTEGER PRIMARY KEY,
      ${CategoryColumns.uuid.name} TEXT,
      ${CategoryColumns.langcode.name} TEXT,
      ${CategoryColumns.name.name} TEXT,
      ${CategoryColumns.iconname.name} TEXT
    )
  ''';

  factory SqlDbService() => _instance;
  SqlDbService._privateConstructor();

  Future<SqlDbService> init() async {
    final dir = await fileService.getDirectory(DirectoryType.appSupport);
    final dbPath = join(dir.path, 'guess-the-text-sql.db');

    _db = await openDatabase(dbPath, version: version, onConfigure: _onConfigure, onCreate: _onCreate, onOpen: _onOpen);

    return this;
  }

  Database _getDb() {
    assert(_db != null, 'Database not initialized. The init() method has to be called on app startup');
    return _db!;
  }

  Future<void> _onConfigure(Database db) async {
    logger.info('configuring sqflite db version ${db.getVersion()}');
  }

  Future<void> _onOpen(Database db) async {
    logger.info('opening sqflite at [${db.path}]');
  }

  Future<void> _onCreate(Database db, int version) async {
    logger.info('creating sqflite db version $version');
    await db.execute(_createTableCategory);
  }

  Future<List<ApiCategory>> getCategories() async {
    List<Map<String, dynamic>> categories =
        await _getDb().query(TableNames.category.name, orderBy: CategoryColumns.id.name);
    return categories.map(ApiCategory.fromJson).toList();
  }

  Future<ApiCategory> createCategory(ApiCategory category) async {
    Map<String, dynamic> toInsert = category.toJson()
      ..remove('isCustom') // Note: 'isCustom' is a transient field (never persisted)
      ..remove(CategoryColumns.id.name); // the 'id' value will be auto-generated
    int newId = await _getDb().insert(TableNames.category.name, toInsert);
    logger.info('created category id $newId - ${category.name}');
    return category.copyWith(id: newId);
  }

  Future<ApiCategory> updateCategory(ApiCategory category) async {
    // Note: isCustom is atransient field (never persisted)
    Map<String, dynamic> toUpdate = category.toJson()..remove('isCustom');
    final where = '${CategoryColumns.id.name} = ?';
    int result = await _getDb().update(TableNames.category.name, toUpdate, where: where, whereArgs: [category.id]);
    logger.info('updated category ${category.name}, result: $result');
    return category;
  }

  Future<void> deleteCategory(ApiCategory category) async {
    final where = '${CategoryColumns.id.name} = ?';
    int result = await _getDb().delete(TableNames.category.name, where: where, whereArgs: [category.id]);
    logger.info('removed category ${category.name}, result: $result');
  }
}
