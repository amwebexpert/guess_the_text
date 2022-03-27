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
  late AppLanguage? _language;

  @override
  void initState() {
    super.initState();
    _language = codesToLanguageMap[preferences.locale.languageCode];
  }

  void changeLanguage(AppLanguage? language) {
    if (language != null) {
      setState(() {
        _language = language;
      });
      preferences.changeLocale([language]);
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
                  groupValue: _language,
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
                  groupValue: _language,
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
                onTap: preferences.toggleTheme,
                leading: Radio<bool>(
                  value: false,
                  activeColor: Theme.of(context).colorScheme.primary,
                  groupValue: preferences.isDarkTheme,
                  onChanged: (_) => preferences.toggleTheme(),
                ),
              ),
              ListTile(
                dense: true,
                title: Text(
                  localizations.prefThemeBrightnessDark,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onTap: preferences.toggleTheme,
                leading: Radio<bool>(
                  value: true,
                  activeColor: Theme.of(context).colorScheme.primary,
                  groupValue: preferences.isDarkTheme,
                  onChanged: (_) => preferences.toggleTheme(),
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
