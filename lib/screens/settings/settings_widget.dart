import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/theme/app_bar/app_bar_title_widget.dart';
import 'package:guess_the_text/theme/theme_utils.dart';

enum SingingCharacter { french, english }

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  SingingCharacter? _character = SingingCharacter.french;

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
                'Lafayette',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onTap: () {
                setState(() {
                  _character = SingingCharacter.french;
                });
              },
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.french,
                activeColor: Theme.of(context).colorScheme.primary,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              dense: true,
              title: Text(
                'Thomas Jefferson',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onTap: () {
                setState(() {
                  _character = SingingCharacter.english;
                });
              },
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.english,
                activeColor: Theme.of(context).colorScheme.primary,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
