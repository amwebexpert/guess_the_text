import 'dart:io';
import 'dart:ui';

import 'package:flutter/scheduler.dart';
import 'package:guess_the_text/utils/language.utils.dart';
import 'package:mobx/mobx.dart';

import 'package:guess_the_text/services/storage/shared_preferences.enum.dart';
import 'package:guess_the_text/services/storage/shared_preferences.services.dart';

import '../../services/logger/logger.service.dart';

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
  final LoggerService logger = LoggerService();
  final sp = SharedPreferencesService();

  @observable
  late bool isDarkTheme = true;

  @observable
  late Locale locale = defaultAppLocale;

  SettingsStoreBase() {
    locale = _initLocale();
    isDarkTheme = _initDarkTheme();
  }

  Locale _initLocale() {
    final String platformLanguageCode = Locale(Platform.localeName.split('_')[0]).languageCode;
    final String appLanguage = sp.getString(SharedPreferenceKey.appLanguage.name, defaultValue: platformLanguageCode);
    return languageToLocaleMap[appLanguage] ?? defaultAppLocale;
  }

  bool _initDarkTheme() {
    final platformThemeMode = SchedulerBinding.instance!.window.platformBrightness;
    return sp.getBool(SharedPreferenceKey.appIsThemeDark.name, defaultValue: platformThemeMode == Brightness.dark);
  }

  @action
  void changeLocale(AppLanguage? newLanguage) {
    if (newLanguage == null) {
      return;
    }

    final languageCode = languageToCodeMap[newLanguage];
    locale = languageToLocaleMap[languageCode]!;
    sp.setString(SharedPreferenceKey.appLanguage.name, languageToCodeMap[newLanguage]!).onError((e, stackTrace) {
      logger.error("Can't write preference ${SharedPreferenceKey.appLanguage}", e, stackTrace: stackTrace);
      return false;
    });
  }

  @action
  void toggleTheme() {
    final bool newValue = !isDarkTheme;
    isDarkTheme = newValue;
    sp.setBool(SharedPreferenceKey.appIsThemeDark.name, newValue).onError((e, stackTrace) {
      logger.error("Can't write preference ${SharedPreferenceKey.appIsThemeDark}", e, stackTrace: stackTrace);
      return false;
    });
  }
}
