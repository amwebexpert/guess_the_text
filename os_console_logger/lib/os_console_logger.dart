import 'os_console_logger_platform_interface.dart';

class OsConsoleLogger {
  Future<String?> getPlatformVersion() => OsConsoleLoggerPlatform.instance.getPlatformVersion();

  Future<void> debug(String message) => OsConsoleLoggerPlatform.instance.debug(message);

  Future<void> error(String message) => OsConsoleLoggerPlatform.instance.error(message);
}
