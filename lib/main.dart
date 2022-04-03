import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guess_the_text/screens/about/about_widget.dart';
import 'package:guess_the_text/screens/categories/categories_widget.dart';
import 'package:guess_the_text/screens/game/game_layout_widget.dart';
import 'package:guess_the_text/screens/settings/settings_widget.dart';
import 'package:guess_the_text/services/hangman/hangman_service.dart';
import 'package:guess_the_text/services/storage/shared_preferences.services.dart';
import 'package:guess_the_text/store/settings/settings.store.dart';
import 'package:guess_the_text/theme/app_theme.dart';
import 'package:guess_the_text/utils/animations.dart';
import 'package:lottie/lottie.dart';

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
    loadData();
  }

  void loadData() async {
    final HangmanService service = HangmanService();

    await Future.wait([service.loadCategories(), SharedPreferencesService().init()]);
    await service.loadData();

    setState(() {
      isLoadingSharedPreferences = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoadingSharedPreferences) {
      return Center(
        child: Lottie.asset(getAnimationPath()),
      );
    }

    return Observer(builder: (BuildContext context) {
      final SettingsStore settingsStore = SettingsStore();

      return MaterialApp(
        // debugShowCheckedModeBanner: false, // uncomment to take screen captures without the banner
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: settingsStore.locale,
        theme: settingsStore.isDarkTheme ? themeDataDark : themeDataLight,
        initialRoute: '/game',
        routes: {
          '/game': (context) => const GameWidget(),
          '/categories': (context) => const CategoriesWidget(),
          '/preferences': (context) => const SettingsWidget(),
          '/about': (context) => const AboutWidget(),
        },
      );
    });
  }
}
