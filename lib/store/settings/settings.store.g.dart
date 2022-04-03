// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on SettingsStoreBase, Store {
  final _$isDarkThemeAtom = Atom(name: 'SettingsStoreBase.isDarkTheme');

  @override
  bool get isDarkTheme {
    _$isDarkThemeAtom.reportRead();
    return super.isDarkTheme;
  }

  @override
  set isDarkTheme(bool value) {
    _$isDarkThemeAtom.reportWrite(value, super.isDarkTheme, () {
      super.isDarkTheme = value;
    });
  }

  final _$localeAtom = Atom(name: 'SettingsStoreBase.locale');

  @override
  Locale get locale {
    _$localeAtom.reportRead();
    return super.locale;
  }

  @override
  set locale(Locale value) {
    _$localeAtom.reportWrite(value, super.locale, () {
      super.locale = value;
    });
  }

  final _$SettingsStoreBaseActionController =
      ActionController(name: 'SettingsStoreBase');

  @override
  void changeLocale(AppLanguage? newLanguage) {
    final _$actionInfo = _$SettingsStoreBaseActionController.startAction(
        name: 'SettingsStoreBase.changeLocale');
    try {
      return super.changeLocale(newLanguage);
    } finally {
      _$SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTheme() {
    final _$actionInfo = _$SettingsStoreBaseActionController.startAction(
        name: 'SettingsStoreBase.toggleTheme');
    try {
      return super.toggleTheme();
    } finally {
      _$SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDarkTheme: ${isDarkTheme},
locale: ${locale}
    ''';
  }
}
