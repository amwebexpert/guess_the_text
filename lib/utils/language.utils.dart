import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum AppLanguage { fr, en }

final Locale defaultAppLocale = Locale(AppLanguage.en.name);

final Map<String, AppLanguage> codesToLanguageMap = AppLanguage.values.asNameMap();

final List<String> supportedLanguages = codesToLanguageMap.keys.toList();

final Map<AppLanguage, String> languageToCodeMap =
    codesToLanguageMap.map((code, enumValue) => MapEntry(enumValue, code));

final Map<String, Locale> languageToLocaleMap = codesToLanguageMap.map((code, _) => MapEntry(code, Locale(code)));

String getLanguageFullNameFromCode(BuildContext context, String languageCode) {
  final AppLocalizations localizations = AppLocalizations.of(context)!;
  final AppLanguage appLanguage = AppLanguage.values.firstWhere((element) => element.name == languageCode);

  switch (appLanguage) {
    case AppLanguage.fr:
      return localizations.prefLangFr;
    case AppLanguage.en:
      return localizations.prefLangEn;

    default:
      throw Exception('Unsupported language : $appLanguage');
  }
}
