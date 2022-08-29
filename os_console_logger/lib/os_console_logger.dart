
import 'os_console_logger_platform_interface.dart';

class OsConsoleLogger {
  Future<String?> getPlatformVersion() {
    return OsConsoleLoggerPlatform.instance.getPlatformVersion();
  }
}
