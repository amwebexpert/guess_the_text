import 'dart:developer';

class LoggerService {
  static final LoggerService _instance = LoggerService._privateConstructor();

  factory LoggerService() => _instance;
  LoggerService._privateConstructor();

  void info(String message) {
    log(message, time: DateTime.now(), name: 'INFO');
  }

  void error(String message, dynamic error, {StackTrace? stackTrace}) {
    log(message, time: DateTime.now(), name: 'ERROR', error: error.toString(), stackTrace: stackTrace);
  }
}
