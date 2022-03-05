import 'dart:io';
import 'dart:ui';

import 'package:mobx/mobx.dart';

class PreferencesStore {
  final Observable<Locale> _locale =
      Observable(Locale(Platform.localeName.split('_')[0]), name: 'Locale');

  // getter/setter wrappers
  Locale get locale => _locale.value;
  set locale(Locale newValue) => _locale.value = newValue;

  // actions
  late Action triggerDelayedLanguageChange;

  PreferencesStore() {
    triggerDelayedLanguageChange = Action(_triggerDelayedLanguageChange);
  }

  void _triggerDelayedLanguageChange() {
    print("______________ changing language !!!");
    print(_locale.value.languageCode);
    String newLanguageCode = _locale.value.languageCode == 'en' ? 'fr' : 'en';
    print(newLanguageCode);
    _locale.value = Locale(newLanguageCode);
  }
}
