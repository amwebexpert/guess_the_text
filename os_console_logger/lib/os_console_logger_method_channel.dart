import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'os_console_logger_platform_interface.dart';

/// An implementation of [OsConsoleLoggerPlatform] that uses method channels.
class MethodChannelOsConsoleLogger extends OsConsoleLoggerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('os_console_logger');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> debug(String message) async {
    final messageToLog = '🐞 $message';
    await methodChannel.invokeMethod<void>('debug', {'message': messageToLog});
  }

  @override
  Future<void> error(String message) async {
    final messageToLog = '🚨🚨🚨 $message';
    await methodChannel.invokeMethod<void>('error', {'message': messageToLog});
  }
}
