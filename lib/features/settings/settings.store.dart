import 'dart:ui';

import 'package:flutter/scheduler.dart';
import 'package:mobx/mobx.dart';
import 'package:universal_io/io.dart';

import '/service.locator.dart';
import '/services/storage/shared.preferences.enum.dart';
import '/services/storage/shared.preferences.services.dart';
import '/utils/language.utils.dart';
import '../../services/logger/logger.service.dart';

// Include generated file
part 'settings.store.g.dart';

// This is the class used by rest of the codebase
class SettingsStore extends _SettingsStoreBase with _$SettingsStore {}

// The store-class
abstract class _SettingsStoreBase with Store {
  final LoggerService logger = serviceLocator.get();
  final SharedPreferencesService preferences = serviceLocator.get();

  @observable
  late bool isDarkTheme = true;

  @observable
  late Locale locale = defaultAppLocale;

  _SettingsStoreBase() {
    locale = _initLocale();
    isDarkTheme = _initDarkTheme();
  }

  Locale _initLocale() {
    final String platformLanguageCode = Locale(Platform.localeName.split('_')[0]).languageCode;
    final String appLanguage =
        preferences.getString(SharedPreferenceKey.appLanguage.name, defaultValue: platformLanguageCode);
    return languageToLocaleMap[appLanguage] ?? defaultAppLocale;
  }

  bool _initDarkTheme() {
    final platformThemeMode = SchedulerBinding.instance.window.platformBrightness;
    return preferences.getBool(SharedPreferenceKey.appIsThemeDark.name,
        defaultValue: platformThemeMode == Brightness.dark);
  }

  @action
  void changeLocale(AppLanguage? newLanguage) {
    if (newLanguage == null) {
      return;
    }

    final languageCode = languageToCodeMap[newLanguage];
    locale = languageToLocaleMap[languageCode]!;
    preferences
        .setString(SharedPreferenceKey.appLanguage.name, languageToCodeMap[newLanguage]!)
        .onError((e, stackTrace) {
      logger.error("Can't write preference ${SharedPreferenceKey.appLanguage}", e, stackTrace: stackTrace);
      return false;
    });
  }

  @action
  void toggleTheme() {
    final bool newValue = !isDarkTheme;
    isDarkTheme = newValue;
    preferences.setBool(SharedPreferenceKey.appIsThemeDark.name, newValue).onError((e, stackTrace) {
      logger.error("Can't write preference ${SharedPreferenceKey.appIsThemeDark}", e, stackTrace: stackTrace);
      return false;
    });
  }
}
