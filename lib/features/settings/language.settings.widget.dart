import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/service.locator.dart';
import '/utils/language.utils.dart';
import 'settings.store.dart';

class LanguageSettingWidget extends StatelessWidget {
  const LanguageSettingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final SettingsStore settings = serviceLocator.get();

    void changeLanguage(AppLanguage? selectedLanguage) {
      final AppLanguage? language = codesToLanguageMap[settings.locale.languageCode];
      if (selectedLanguage != language) {
        settings.changeLocale(selectedLanguage);
      }
    }

    return Observer(builder: (context) {
      final appLanguage = codesToLanguageMap[settings.locale.languageCode]!;

      return Column(
        children: <Widget>[
          ListTile(leading: const Icon(Icons.language), title: Text(localizations.prefLanguage)),
          LanguageWidget(
              appLanguage: appLanguage,
              title: localizations.prefLangFr,
              language: AppLanguage.fr,
              changeLanguage: changeLanguage),
          LanguageWidget(
              appLanguage: appLanguage,
              title: localizations.prefLangEn,
              language: AppLanguage.en,
              changeLanguage: changeLanguage),
        ],
      );
    });
  }
}

class LanguageWidget extends StatelessWidget {
  const LanguageWidget(
      {Key? key, required this.title, required this.appLanguage, required this.language, required this.changeLanguage})
      : super(key: key);

  final String title;
  final AppLanguage language;
  final AppLanguage appLanguage;
  final void Function(AppLanguage? selectedLanguage) changeLanguage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(title, style: Theme.of(context).textTheme.bodyText1),
      onTap: () => changeLanguage(language),
      leading: Radio<AppLanguage>(
        value: language,
        activeColor: Theme.of(context).colorScheme.primary,
        groupValue: appLanguage,
        onChanged: changeLanguage,
      ),
    );
  }
}
