import 'dart:io';
import 'dart:ui';

import 'package:mobx/mobx.dart';

class PreferencesStore {
  static final PreferencesStore _instance = PreferencesStore._privateConstructor();

  final Observable<Locale> _locale =
      Observable(Locale(Platform.localeName.split('_')[0]), name: 'User prefered locale');

  // getter wrappers
  Locale get locale => _locale.value;

  // actions ()
  late Action toggleLocale;

  factory PreferencesStore() => _instance;

  PreferencesStore._privateConstructor() {
    toggleLocale = Action(_toggleLocale);
  }

  void _toggleLocale() {
    String actualLanguageCode = locale.languageCode;
    String newLanguageCode = locale.languageCode == 'en' ? 'fr' : 'en';
    print("Locale [$actualLanguageCode] ==> [$newLanguageCode]");
    _locale.value = Locale(newLanguageCode);
  }
}
