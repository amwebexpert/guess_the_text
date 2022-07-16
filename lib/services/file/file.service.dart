import 'dart:convert';
import 'dart:io';

import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/services/file/directory.enum.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';
import 'package:path_provider/path_provider.dart';

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
    Directory supportDir = await getDirectory(directoryType);
    String fullFilenanme = '${supportDir.path}/$filename';
    File file = File(fullFilenanme);

    logger.info('writing data to file $fullFilenanme');
    return file.writeAsString(data, mode: FileMode.write, encoding: utf8, flush: false);
  }

  Future<String> read({required String filename, required DirectoryType directoryType}) async {
    Directory supportDir = await getDirectory(directoryType);
    String fullFilenanme = '${supportDir.path}/$filename';
    File file = File(fullFilenanme);

    logger.info('reading data from $fullFilenanme');
    return file.readAsString(encoding: utf8);
  }
}
