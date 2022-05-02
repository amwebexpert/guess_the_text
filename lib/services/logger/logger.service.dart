import 'dart:developer';

import 'package:flutter/foundation.dart';

class LoggerService {
  static final LoggerService _instance = LoggerService._privateConstructor();

  factory LoggerService() => _instance;
  LoggerService._privateConstructor();

  void info(String message) {
    log(message, time: DateTime.now(), name: 'INFO');
    if (kDebugMode) {
      print(message);
    }
  }

  void error(String message, dynamic error) {
    log(message, time: DateTime.now(), name: 'ERROR', error: error.toString());
  }
}
