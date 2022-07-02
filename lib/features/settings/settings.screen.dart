import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/features/settings/brightness.settings.widget.dart';

import '/features/settings/hero.settings.widget.dart';
import '/theme/theme.utils.dart';
import '/theme/widgets/app.bar.title.widget.dart';
import '/theme/widgets/full.screen.bg.image.widget.dart';
import 'language.settings.widget.dart';

class SettingsWidget extends StatelessWidget {
  static const String backgroundImageDark = 'assets/images/backgrounds/background-pexels-pixabay-461940.jpg';
  static const String backgroundImageLight = 'assets/images/backgrounds/beach-sun.jpg';

  const SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.preferences),
      ),
      body: FullScreenAssetBackground(
        assetImagePath: isDarkTheme ? backgroundImageDark : backgroundImageLight,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: spacing(1)),
            child: Column(
              children: <Widget>[
                HeroSettingsWidget(),
                const LanguageSettingWidget(),
                const Divider(),
                const BrightnessSettingWidget(),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
