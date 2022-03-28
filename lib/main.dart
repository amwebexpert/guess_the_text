import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart' as spinner;

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:guess_the_text/screens/categories/categories_widget.dart';
import 'package:guess_the_text/screens/game/game_layout_widget.dart';
import 'package:guess_the_text/screens/loading/loading_widget.dart';
import 'package:guess_the_text/screens/about/about_widget.dart';
import 'package:guess_the_text/screens/settings/settings_widget.dart';
import 'package:guess_the_text/services/storage/shared_preferences.services.dart';
import 'package:guess_the_text/store/preferences_store.dart';
import 'package:guess_the_text/theme/app_theme.dart';

void main() => runApp(const HangmanApp());

class HangmanApp extends StatefulWidget {
  const HangmanApp({Key? key}) : super(key: key);

  @override
  State<HangmanApp> createState() => _HangmanAppState();
}

class _HangmanAppState extends State<HangmanApp> {
  bool isLoadingSharedPreferences = true;

  @override
  void initState() {
    super.initState();

    SharedPreferencesService().init().then((_) {
      setState(() {
        isLoadingSharedPreferences = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoadingSharedPreferences) {
      return const SizedBox.shrink(); // TODO loading spinner or animation
    }

    return Observer(builder: (BuildContext context) {
      final PreferencesStore preferencesStore = PreferencesStore();

      return MaterialApp(
        // debugShowCheckedModeBanner: false, // uncomment to take screen captures without the banner
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: preferencesStore.locale,
        theme: preferencesStore.isDarkTheme ? themeDataDark : themeDataLight,
        initialRoute: '/',
        routes: {
          '/': (context) => const LoadingWidget(),
          '/game': (context) => const GameWidget(),
          '/categories': (context) => const CategoriesWidget(),
          '/preferences': (context) => const SettingsWidget(),
          '/about': (context) => const AboutWidget(),
        },
      );
    });
  }
}
