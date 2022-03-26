import 'dart:ui';

enum AppLanguage { french, english }

const Map<AppLanguage, Locale> languageToLocaleMap = {
  AppLanguage.english: Locale('en'),
  AppLanguage.french: Locale('fr'),
};

const Map<AppLanguage, String> languageToCodeMap = {
  AppLanguage.english: 'en',
  AppLanguage.french: 'fr',
};

const Map<String, AppLanguage> codesToLanguageMap = {
  'en': AppLanguage.english,
  'fr': AppLanguage.french,
};
