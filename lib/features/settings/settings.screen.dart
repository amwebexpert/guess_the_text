import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/theme/theme.utils.dart';
import 'package:guess_the_text/utils/language.utils.dart';
import 'package:guess_the_text/widgets/app_bar_title.widget.dart';

import 'settings.store.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  static const String backgroundImageDark = 'assets/images/backgrounds/background-pexels-pixabay-461940.jpg';
  static const String backgroundImageLight = 'assets/images/backgrounds/beach-sun.jpg';

  final SettingsStore settings = serviceLocator.get();

  void themeBrightnessChanged(bool? isDark) {
    if (isDark != settings.isDarkTheme) {
      settings.toggleTheme();
    }
  }

  void changeLanguage(AppLanguage? selectedLanguage) {
    final AppLanguage? language = codesToLanguageMap[settings.locale.languageCode];
    if (selectedLanguage != language) {
      settings.changeLocale(selectedLanguage);
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
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(settings.isDarkTheme ? backgroundImageDark : backgroundImageLight),
                  fit: BoxFit.cover)),
          child: Padding(
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
                    groupValue: codesToLanguageMap[settings.locale.languageCode],
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
                    groupValue: codesToLanguageMap[settings.locale.languageCode],
                    onChanged: changeLanguage,
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(settings.isDarkTheme ? Icons.nightlight : Icons.sunny),
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
                    groupValue: settings.isDarkTheme,
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
                    groupValue: settings.isDarkTheme,
                    onChanged: themeBrightnessChanged,
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
