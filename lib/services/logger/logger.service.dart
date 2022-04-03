class LoggerService {
  static final LoggerService _instance = LoggerService._privateConstructor();

  factory LoggerService() => _instance;
  LoggerService._privateConstructor();

  void info(String message) {
    // ignore: avoid_print
    print(message);
  }

  void error(String message, dynamic error) {
    // ignore: avoid_print
    print('ERROR. $message: ${error.toString()}');
  }
}
