import 'dart:ui';

enum AppLanguage { fr, en }

final defaultAppLocale = Locale(AppLanguage.en.name);

final Map<String, AppLanguage> codesToLanguageMap = AppLanguage.values.asNameMap();

final List<String> supportedLanguages = codesToLanguageMap.keys.toList();

final Map<AppLanguage, String> languageToCodeMap =
    codesToLanguageMap.map((code, enumValue) => MapEntry(enumValue, code));

final Map<String, Locale> languageToLocaleMap = codesToLanguageMap.map((code, _) => MapEntry(code, Locale(code)));
