// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on _SettingsStoreBase, Store {
  late final _$isDarkThemeAtom =
      Atom(name: '_SettingsStoreBase.isDarkTheme', context: context);

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

  late final _$localeAtom =
      Atom(name: '_SettingsStoreBase.locale', context: context);

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

  late final _$_SettingsStoreBaseActionController =
      ActionController(name: '_SettingsStoreBase', context: context);

  @override
  void changeLocale(AppLanguage? newLanguage) {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase.changeLocale');
    try {
      return super.changeLocale(newLanguage);
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTheme() {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase.toggleTheme');
    try {
      return super.toggleTheme();
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
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
