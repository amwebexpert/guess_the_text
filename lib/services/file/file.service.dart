import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../service.locator.dart';
import '../logger/logger.service.dart';
import 'directory.enum.dart';

class FileService {
  final LoggerService logger = serviceLocator.get();
  static final FileService _instance = FileService._privateConstructor();

  factory FileService() => _instance;
  FileService._privateConstructor();

  Future<Directory> getDirectory(DirectoryType directoryType) async {
    switch (directoryType) {
      case DirectoryType.appSupport:
        return getApplicationSupportDirectory();

      case DirectoryType.documents:
        return getApplicationDocumentsDirectory();

      case DirectoryType.temporary:
        return getTemporaryDirectory();

      default:
        logger.error('unsupported type, returning temporary dir as default', directoryType);
        return getTemporaryDirectory();
    }
  }

  Future<File> write({required String data, required String filename, required DirectoryType directoryType}) async {
    final String fullFilenanme = await buildFullFilename(directoryType, filename);
    final File file = await File(fullFilenanme).create(recursive: true);

    logger.info('writing data to file $fullFilenanme');
    return file.writeAsString(data, mode: FileMode.write, encoding: utf8, flush: false);
  }

  Future<String> read({required String filename, required DirectoryType directoryType}) async {
    final String fullFilenanme = await buildFullFilename(directoryType, filename);
    final File file = File(fullFilenanme);

    if (!file.existsSync()) {
      logger.error('file does not exists', fullFilenanme);
      return '';
    }

    logger.info('reading data from $fullFilenanme');
    return file.readAsString(encoding: utf8);
  }

  Future<String> buildFullFilename(DirectoryType directoryType, String filename) async {
    final Directory directory = await getDirectory(directoryType);
    return join(directory.path, filename);
  }
}
