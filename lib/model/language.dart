import 'dart:ui';

enum AppLanguage { fr, en }

final supportedLanguages = AppLanguage.values.asNameMap().entries.map((e) => e.key).toList();

final Map<String, AppLanguage> codesToLanguageMap = AppLanguage.values.asNameMap();

final Map<AppLanguage, String> languageToCodeMap = codesToLanguageMap.map((value, key) => MapEntry(key, value));

final Map<String, Locale> languageToLocaleMap = {for (var v in supportedLanguages) v: Locale(v)};
