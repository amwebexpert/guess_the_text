import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guess_the_text/model/language.dart';
import 'package:guess_the_text/store/preferences_store.dart';
import 'package:guess_the_text/theme/app_bar/app_bar_title_widget.dart';
import 'package:guess_the_text/theme/theme_utils.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  final PreferencesStore preferences = PreferencesStore();

  void themeBrightnessChanged(bool? isDark) {
    if (isDark != preferences.isDarkTheme) {
      preferences.toggleTheme();
    }
  }

  void changeLanguage(AppLanguage? selectedLanguage) {
    final AppLanguage? language = codesToLanguageMap[preferences.locale.languageCode];
    if (selectedLanguage != language) {
      preferences.changeLocale([selectedLanguage]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: localizations.preferences),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: spacing(1)),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.language),
                title: Text(localizations.prefLanguage),
              ),
              ListTile(
                dense: true,
                title: Text(
                  localizations.prefLangFr,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onTap: () => changeLanguage(AppLanguage.fr),
                leading: Radio<AppLanguage>(
                  value: AppLanguage.fr,
                  activeColor: Theme.of(context).colorScheme.primary,
                  groupValue: codesToLanguageMap[preferences.locale.languageCode],
                  onChanged: changeLanguage,
                ),
              ),
              ListTile(
                dense: true,
                title: Text(
                  localizations.prefLangEn,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onTap: () => changeLanguage(AppLanguage.en),
                leading: Radio<AppLanguage>(
                  value: AppLanguage.en,
                  activeColor: Theme.of(context).colorScheme.primary,
                  groupValue: codesToLanguageMap[preferences.locale.languageCode],
                  onChanged: changeLanguage,
                ),
              ),
              const Divider(),
              ListTile(
                leading: Icon(preferences.isDarkTheme ? Icons.nightlight : Icons.sunny),
                title: Text(localizations.prefThemeBrightness),
              ),
              ListTile(
                dense: true,
                title: Text(
                  localizations.prefThemeBrightnessLight,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onTap: () => themeBrightnessChanged(false),
                leading: Radio<bool>(
                  value: false,
                  activeColor: Theme.of(context).colorScheme.primary,
                  groupValue: preferences.isDarkTheme,
                  onChanged: themeBrightnessChanged,
                ),
              ),
              ListTile(
                dense: true,
                title: Text(
                  localizations.prefThemeBrightnessDark,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onTap: () => themeBrightnessChanged(true),
                leading: Radio<bool>(
                  value: true,
                  activeColor: Theme.of(context).colorScheme.primary,
                  groupValue: preferences.isDarkTheme,
                  onChanged: themeBrightnessChanged,
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      );
    });
  }
}
