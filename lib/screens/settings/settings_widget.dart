import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/model/language.dart';
import 'package:guess_the_text/store/preferences.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.preferences),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: spacing(1)),
        child: Column(
          children: <Widget>[
            ListTile(
              dense: true,
              title: Text(
                localizations.prefLangFr,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onTap: () => changeLanguage(AppLanguage.french),
              leading: Radio<AppLanguage>(
                value: AppLanguage.french,
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
              onTap: () => changeLanguage(AppLanguage.english),
              leading: Radio<AppLanguage>(
                value: AppLanguage.english,
                activeColor: Theme.of(context).colorScheme.primary,
                groupValue: _language,
                onChanged: changeLanguage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
