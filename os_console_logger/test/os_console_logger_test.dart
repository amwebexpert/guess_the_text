import 'package:flutter_test/flutter_test.dart';
import 'package:os_console_logger/os_console_logger.dart';
import 'package:os_console_logger/os_console_logger_platform_interface.dart';
import 'package:os_console_logger/os_console_logger_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOsConsoleLoggerPlatform with MockPlatformInterfaceMixin implements OsConsoleLoggerPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> debug(String message) => Future.value();

  @override
  Future<void> error(String message) => Future.value();
}

void main() {
  final OsConsoleLoggerPlatform initialPlatform = OsConsoleLoggerPlatform.instance;

  test('$MethodChannelOsConsoleLogger is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOsConsoleLogger>());
  });

  test('getPlatformVersion', () async {
    OsConsoleLogger osConsoleLoggerPlugin = OsConsoleLogger();
    MockOsConsoleLoggerPlatform fakePlatform = MockOsConsoleLoggerPlatform();
    OsConsoleLoggerPlatform.instance = fakePlatform;
    expect(await osConsoleLoggerPlugin.getPlatformVersion(), '42');
  });
}
