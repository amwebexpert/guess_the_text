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

class DeviceInfoService {
  static final DeviceInfoService _instance = DeviceInfoService._privateConstructor();

  final deviceInfoPlugin = DeviceInfoPlugin();

  factory DeviceInfoService() => _instance;
  DeviceInfoService._privateConstructor();

  Future<Map<String, dynamic>> loadInfo() async {
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    final rawMap = deviceInfo.toMap();
    return SplayTreeMap.from(rawMap, (a, b) => a.compareTo(b));
  }
}
