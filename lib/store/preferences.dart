import 'dart:io';
import 'dart:ui';

import 'package:mobx/mobx.dart';

class PreferencesStore {
  static PreferencesStore? _instance;

  final Observable<Locale> _locale = Observable(
      Locale(Platform.localeName.split('_')[0]),
      name: 'User prefered locale');

  // getter/setter wrappers
  Locale get locale => _locale.value;
  set locale(Locale newValue) => _locale.value = newValue;

  // actions ()
  late Action toggleLocale;

  // factory constructor, allows the singleton pattern. Anywhere in the app we can do things like the following:
  // - PreferencesStore().toggleLocale();
  // only one instance of the store will be created
  factory PreferencesStore() {
    _instance ??= PreferencesStore._();
    return _instance!;
  }

  PreferencesStore._() {
    toggleLocale = Action(_toggleLocale);
  }

  void _toggleLocale() {
    String actualLanguageCode = locale.languageCode;
    String newLanguageCode = locale.languageCode == 'en' ? 'fr' : 'en';
    print("Locale [$actualLanguageCode] ==> [$newLanguageCode]");
    locale = Locale(newLanguageCode);
  }
}
