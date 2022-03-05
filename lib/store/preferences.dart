import 'dart:io';
import 'dart:ui';

import 'package:mobx/mobx.dart';

class PreferencesStore {
  final Observable<Locale> _locale = Observable(
      Locale(Platform.localeName.split('_')[0]),
      name: 'User prefered locale');

  // getter/setter wrappers
  Locale get locale => _locale.value;
  set locale(Locale newValue) => _locale.value = newValue;

  // actions
  late Action toggleLocale;

  PreferencesStore() {
    toggleLocale = Action(_toggleLocale);
  }

  void _toggleLocale() {
    print("______________ changing language !!!");
    print(locale.languageCode);
    String newLanguageCode = locale.languageCode == 'en' ? 'fr' : 'en';
    print(newLanguageCode);
    locale = Locale(newLanguageCode);
  }
}
