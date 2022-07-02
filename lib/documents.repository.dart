import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

import '/service.locator.dart';
import '/services/logger/logger.service.dart';

class DocumentsRepository {
  static final DocumentsRepository _instance = DocumentsRepository._privateConstructor();

  final LoggerService logger = serviceLocator.get();
  late final Database db;

  factory DocumentsRepository() => _instance;
  DocumentsRepository._privateConstructor();

  Future<void> init() async {
    if (kIsWeb) {
      await initWebPlatform();
    } else {
      await initNonWebPlatform();
    }
  }

  Future<void> initWebPlatform() async {
    const dbPath = 'guess-the-text-sembast-web-bd';
    logger.info('initializing database at location: $dbPath');

    db = await databaseFactoryWeb.openDatabase(dbPath);
  }

  Future<void> initNonWebPlatform() async {
    final dbPath = await _getDbFullPath();
    logger.info('initializing database at location: $dbPath');

    db = await databaseFactoryIo.openDatabase(dbPath);
  }

  Future<String> _getDbFullPath() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    return join(dir.path, 'game_storage.db');
  }
}
