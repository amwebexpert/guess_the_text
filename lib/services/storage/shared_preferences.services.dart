import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance = SharedPreferencesService._privateConstructor();
  late final SharedPreferences _prefs;

  factory SharedPreferencesService() => _instance;
  SharedPreferencesService._privateConstructor();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Set<String> getKeys() => _prefs.getKeys();
  bool hasKey(String key) => _prefs.containsKey(key);
  Future<void> remove(String key) => _prefs.remove(key);

  int getInt(String key, {int defaultValue = 0}) => _prefs.getInt(key) ?? defaultValue;
  bool getBool(String key, {bool defaultValue = false}) => _prefs.getBool(key) ?? defaultValue;
  double getDouble(String key, {double defaultValue = 0}) => _prefs.getDouble(key) ?? defaultValue;
  String getString(String key, {String defaultValue = ''}) => _prefs.getString(key) ?? defaultValue;
  List<String> getStringList(String key, {List<String> defaultValue = const []}) =>
      _prefs.getStringList(key) ?? defaultValue;

  Future<bool> setInt(String key, int value) => _prefs.setInt(key, value);
  Future<bool> setBool(String key, bool value) => _prefs.setBool(key, value);
  Future<bool> setDouble(String key, double value) => _prefs.setDouble(key, value);
  Future<bool> setString(String key, String value) => _prefs.setString(key, value);
  Future<bool> setStringList(String key, List<String> value) => _prefs.setStringList(key, value);
}
