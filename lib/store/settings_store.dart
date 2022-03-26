import 'dart:io';
import 'dart:ui';

import 'package:guess_the_text/model/language.dart';
import 'package:mobx/mobx.dart';

class PreferencesStore {
  static final PreferencesStore _instance = PreferencesStore._privateConstructor();

  final Observable<bool> _isDarkTheme = Observable(true);
  final Observable<Locale> _locale =
      Observable(Locale(Platform.localeName.split('_')[0]), name: 'User prefered locale');

  // getters
  Locale get locale => _locale.value;
  bool get isDarkTheme => _isDarkTheme.value;

  // actions
  late Action changeLocale;
  late Action toggleTheme;

  factory PreferencesStore() => _instance;

  PreferencesStore._privateConstructor() {
    changeLocale = Action(_changeLocale);
    toggleTheme = Action(_toggleTheme);
  }

  void _changeLocale(AppLanguage newLanguage) {
    _locale.value = languageToLocaleMap[newLanguage]!;
  }

  void _toggleTheme() {
    _isDarkTheme.value = !_isDarkTheme.value;
  }
}
