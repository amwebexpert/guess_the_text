import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guess_the_text/widgets/app_error.widget.dart';
import 'package:guess_the_text/route_generator.dart';
import 'package:guess_the_text/services/hangman/model/api_category.model.dart';
import 'package:guess_the_text/services/hangman/texts.service.dart';
import 'package:guess_the_text/services/storage/shared_preferences.services.dart';
import 'package:guess_the_text/features/settings/settings.store.dart';
import 'package:guess_the_text/theme/app.theme.dart';
import 'package:guess_the_text/utils/animation.utils.dart';
import 'package:guess_the_text/utils/randomizer.utils.dart';
import 'package:lottie/lottie.dart';

void main() {
  if (!kDebugMode) {
    ErrorWidget.builder = (FlutterErrorDetails details) => AppErrorWidget(details: details);
  }
  runApp(const HangmanApp());
}

class HangmanApp extends StatefulWidget {
  const HangmanApp({Key? key}) : super(key: key);

  @override
  State<HangmanApp> createState() => _HangmanAppState();
}

class _HangmanAppState extends State<HangmanApp> {
  bool isAppLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final TextsService textsService = TextsService();

    await Future.wait([textsService.getCategories(), SharedPreferencesService().init()]);
    List<ApiCategory> categories = await textsService.getCategories();
    await textsService.getTexts(categories.first.uuid);

    // If the widget was removed from the tree while the asynchronous call was in flight
    if (!mounted) {
      return;
    }

    setState(() {
      isAppLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isAppLoading) {
      return Center(
        child: Lottie.asset(AnimationUtils(RandomizerUtils()).getAnimationPath()),
      );
    }

    final SettingsStore settingsStore = SettingsStore();

    return Observer(builder: (BuildContext context) {
      return MaterialApp(
        // debugShowCheckedModeBanner: false, // uncomment to take screen captures without the banner
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: settingsStore.locale,
        theme: themeDataLight,
        darkTheme: themeDataDark,
        themeMode: settingsStore.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
        initialRoute: '/',
        onGenerateRoute: onGenerateRoute,
      );
    });
  }
}
