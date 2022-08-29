import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'os_console_logger_method_channel.dart';

abstract class OsConsoleLoggerPlatform extends PlatformInterface {
  /// Constructs a OsConsoleLoggerPlatform.
  OsConsoleLoggerPlatform() : super(token: _token);

  static final Object _token = Object();

  static OsConsoleLoggerPlatform _instance = MethodChannelOsConsoleLogger();

  /// The default instance of [OsConsoleLoggerPlatform] to use.
  ///
  /// Defaults to [MethodChannelOsConsoleLogger].
  static OsConsoleLoggerPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OsConsoleLoggerPlatform] when
  /// they register themselves.
  static set instance(OsConsoleLoggerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
