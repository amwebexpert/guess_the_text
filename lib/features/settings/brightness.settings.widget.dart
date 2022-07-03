import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/service.locator.dart';
import 'settings.store.dart';

class BrightnessSettingWidget extends StatelessWidget {
  const BrightnessSettingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsStore settings = serviceLocator.get();
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    void themeBrightnessChanged(bool? isDark) {
      if (isDark != settings.isDarkTheme) {
        settings.toggleTheme();
      }
    }

    return Observer(builder: (context) {
      return SwitchListTile.adaptive(
          title: Text(localizations.prefThemeBrightness),
          subtitle: Text(
            isDarkTheme ? localizations.prefThemeBrightnessDark : localizations.prefThemeBrightnessLight,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          value: isDarkTheme,
          activeColor: Theme.of(context).colorScheme.primary,
          inactiveThumbColor: Colors.grey,
          secondary: Icon(isDarkTheme ? Icons.nightlight : Icons.sunny),
          onChanged: themeBrightnessChanged);
    });
  }
}
