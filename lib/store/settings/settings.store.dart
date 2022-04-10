import 'dart:io';
import 'dart:ui';

import 'package:guess_the_text/model/language.dart';
import 'package:mobx/mobx.dart';

import 'package:guess_the_text/services/storage/shared_preferences.enum.dart';
import 'package:guess_the_text/services/storage/shared_preferences.services.dart';

// Include generated file
part 'settings.store.g.dart';

// This is the class used by rest of the codebase
class SettingsStore extends SettingsStoreBase with _$SettingsStore {
  static final SettingsStore _instance = SettingsStore._privateConstructor();

  factory SettingsStore() => _instance;

  SettingsStore._privateConstructor() : super();
}

// The store-class
abstract class SettingsStoreBase with Store {
  final sp = SharedPreferencesService();

  @observable
  late bool isDarkTheme = false;

  @observable
  late Locale locale = Locale(AppLanguage.en.name);

  SettingsStoreBase() {
    locale = _initLocale();
    isDarkTheme = _initDarkTheme();
  }

  Locale _initLocale() {
    final String platformLanguageCode = Locale(Platform.localeName.split('_')[0]).languageCode;
    final String appLanguage = sp.getString(SharedPreferenceKey.appLanguage.name, defaultValue: platformLanguageCode);
    return languageToLocaleMap[appLanguage] ?? Locale(AppLanguage.en.name);
  }

  bool _initDarkTheme() => sp.getBool(SharedPreferenceKey.appIsThemeDark.name, defaultValue: true);

  @action
  void changeLocale(AppLanguage? newLanguage) {
    if (newLanguage == null) {
      return;
    }

    final languageCode = languageToCodeMap[newLanguage];
    locale = languageToLocaleMap[languageCode]!;
    // TODO handle this promise catchError
    sp.setString(SharedPreferenceKey.appLanguage.name, languageToCodeMap[newLanguage]!);
  }

  @action
  void toggleTheme() {
    final bool newValue = !isDarkTheme;
    isDarkTheme = newValue;
    // TODO handle this promise catchError
    sp.setBool(SharedPreferenceKey.appIsThemeDark.name, newValue);
  }
}
