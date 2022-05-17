import 'dart:collection';

import 'package:device_info_plus/device_info_plus.dart';

const hiddenDeviceProperties = [
  'utsname',
  'identifierForVendor',
  'id',
  'androidId',
  'fingerprint',
  'bootloader',
  'systemFeatures'
];

class DeviceInfoUtils {
  static final DeviceInfoUtils _instance = DeviceInfoUtils._privateConstructor();

  final deviceInfoPlugin = DeviceInfoPlugin();

  factory DeviceInfoUtils() => _instance;
  DeviceInfoUtils._privateConstructor();

  Future<Map<String, dynamic>> loadInfo() async {
    final BaseDeviceInfo deviceInfo = await deviceInfoPlugin.deviceInfo;
    return deviceInfo.toMap();
  }

  Future<Map<String, dynamic>> loadAboutDeviceInfo() async {
    final Map<String, dynamic> rawMap = await loadInfo();
    rawMap.removeWhere((key, value) => hiddenDeviceProperties.contains(key));

    return SplayTreeMap.from(rawMap, (a, b) => a.compareTo(b));
  }
}
