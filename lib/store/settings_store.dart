import 'dart:io';
import 'dart:ui';

import 'package:guess_the_text/model/language.dart';
import 'package:mobx/mobx.dart';

class PreferencesStore {
  static final PreferencesStore _instance = PreferencesStore._privateConstructor();

  final Observable<Locale> _locale =
      Observable(Locale(Platform.localeName.split('_')[0]), name: 'User prefered locale');

  // getter wrappers
  Locale get locale => _locale.value;

  // actions ()
  late Action changeLocale;

  factory PreferencesStore() => _instance;

  PreferencesStore._privateConstructor() {
    changeLocale = Action(_changeLocale);
  }

  void _changeLocale(AppLanguage newLanguage) {
    _locale.value = languageToLocaleMap[newLanguage]!;
  }
}
