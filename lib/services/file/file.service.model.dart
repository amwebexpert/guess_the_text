import 'dart:io';
import 'dart:isolate';

class FileWriteInputs {
  final SendPort sendPort;
  final String fullFilenanme;
  final String data;

  FileWriteInputs({required this.sendPort, required this.fullFilenanme, required this.data});
}

class FileReadInputs {
  final SendPort sendPort;
  final File file;

  FileReadInputs({required this.sendPort, required this.file});
}
