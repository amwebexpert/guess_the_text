import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfosService {
  static final DeviceInfosService _instance = DeviceInfosService._privateConstructor();

  final deviceInfoPlugin = DeviceInfoPlugin();

  factory DeviceInfosService() => _instance;
  DeviceInfosService._privateConstructor();

  Future<Map<String, dynamic>> loadInfos() async {
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    return deviceInfo.toMap();
  }
}
