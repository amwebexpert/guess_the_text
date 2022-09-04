import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../service.locator.dart';
import '../logger/logger.service.dart';
import 'directory.enum.dart';
import 'file.service.model.dart';

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
        logger.error('unsupported type $directoryType, returning temporary dir as default');
        return getTemporaryDirectory();
    }
  }

  Future<File> write({required String data, required String filename, required DirectoryType directoryType}) async {
    // Note: path_provider has to be used inside main Isolate:
    // https://github.com/flutter/flutter/issues/45491
    // https://github.com/flutter/flutter/issues/13937
    final String fullFilenanme = await buildFullFilename(directoryType, filename);

    // all the other operations can run in background
    final port = ReceivePort();
    final inputs = FileWriteInputs(sendPort: port.sendPort, fullFilenanme: fullFilenanme, data: data);
    await Isolate.spawn(_writeInBackground, inputs);
    final File file = await port.first as File;

    logger.info('data written to file "${file.uri}".');
    return file;
  }

  Future<File> _writeInBackground(FileWriteInputs inputs) async {
    SendPort port = inputs.sendPort;
    String fullFilenanme = inputs.fullFilenanme;
    String data = inputs.data;

    logger.info('writing data to file "$fullFilenanme"...');
    final File file = await File(fullFilenanme).create(recursive: true);
    final updatedFile = await file.writeAsString(data, mode: FileMode.write, encoding: utf8, flush: true);

    Isolate.exit(port, updatedFile);
  }

  Future<String> read({required String filename, required DirectoryType directoryType}) async {
    final String fullFilenanme = await buildFullFilename(directoryType, filename);
    final File file = File(fullFilenanme);

    if (!file.existsSync()) {
      logger.error('file does not exists: $fullFilenanme');
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
