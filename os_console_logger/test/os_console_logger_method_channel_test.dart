import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:os_console_logger/os_console_logger_method_channel.dart';

void main() {
  MethodChannelOsConsoleLogger platform = MethodChannelOsConsoleLogger();
  const MethodChannel channel = MethodChannel('os_console_logger');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
