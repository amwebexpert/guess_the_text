// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'os_console_logger_platform_interface.dart';

/// A web implementation of the OsConsoleLoggerPlatform of the OsConsoleLogger plugin.
class OsConsoleLoggerWeb extends OsConsoleLoggerPlatform {
  /// Constructs a OsConsoleLoggerWeb
  OsConsoleLoggerWeb();

  static void registerWith(Registrar registrar) {
    OsConsoleLoggerPlatform.instance = OsConsoleLoggerWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final List<String> infos = [];

    final navigator = html.window.navigator;
    infos.add('UserAgent: ${navigator.userAgent}');
    infos.add('Platform: ${navigator.platform ?? 'Unknown'}');
    infos.add('AppCodeName: ${navigator.appCodeName}');
    infos.add('Language: ${navigator.language}');

    return infos.join('\n');
  }

  @override
  Future<void> debug(String message) async => html.window.console.debug(message);

  @override
  Future<void> error(String message) async => html.window.console.error(message);
}
