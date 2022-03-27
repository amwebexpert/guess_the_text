import 'dart:io';
import 'dart:ui';

import 'package:guess_the_text/model/language.dart';
import 'package:guess_the_text/services/storage/shared_preferences.enum.dart';
import 'package:guess_the_text/services/storage/shared_preferences.services.dart';
import 'package:mobx/mobx.dart';

class PreferencesStore {
  static final PreferencesStore _instance = PreferencesStore._privateConstructor();
  final sp = SharedPreferencesService();

  late final Observable<bool> _isDarkTheme;
  late final Observable<Locale> _locale;

  // getters
  Locale get locale => _locale.value;
  bool get isDarkTheme => _isDarkTheme.value;

  // actions
  late final Action changeLocale;
  late final Action toggleTheme;

  factory PreferencesStore() => _instance;

  PreferencesStore._privateConstructor() {
    final String platformLanguageCode = Locale(Platform.localeName.split('_')[0]).languageCode;
    final String appLanguage = sp.getString(SharedPreferenceKey.appLanguage.name, defaultValue: platformLanguageCode);
    _locale = Observable(languageToLocaleMap[appLanguage]!, name: 'appLocale');

    _isDarkTheme =
        Observable(sp.getBool(SharedPreferenceKey.appIsThemeDark.name, defaultValue: true), name: 'isDarkTheme');

    changeLocale = Action(_changeLocale);
    toggleTheme = Action(_toggleTheme);
  }

  void _changeLocale(AppLanguage newLanguage) {
    final languageCode = languageToCodeMap[newLanguage];
    _locale.value = languageToLocaleMap[languageCode]!;
    sp.setString(SharedPreferenceKey.appLanguage.name, languageToCodeMap[newLanguage]!);
  }

  void _toggleTheme() {
    final bool newValue = !_isDarkTheme.value;
    _isDarkTheme.value = newValue;
    sp.setBool(SharedPreferenceKey.appIsThemeDark.name, newValue);
  }
}
