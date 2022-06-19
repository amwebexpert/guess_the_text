import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/theme/widgets/app.error.widget.dart';
import 'package:guess_the_text/route.generator.dart';
import 'package:guess_the_text/features/categories/api.category.model.dart';
import 'package:guess_the_text/features/game/api.texts.service.dart';
import 'package:guess_the_text/features/settings/settings.store.dart';
import 'package:guess_the_text/theme/app.theme.dart';
import 'package:guess_the_text/utils/animation.utils.dart';
import 'package:guess_the_text/utils/randomizer.utils.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
    final serviceLocator = await initServiceLocator();
    final TextsService textsService = serviceLocator.get<TextsService>();

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

    final SettingsStore settingsStore = serviceLocator.get<SettingsStore>();

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
        builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          maxWidth: 1200,
          backgroundColor: Colors.black,
          breakpoints: const [
            ResponsiveBreakpoint.resize(576, name: MOBILE),
            ResponsiveBreakpoint.resize(768, name: TABLET),
            ResponsiveBreakpoint.resize(992, name: DESKTOP),
          ],
        ),
      );
    });
  }
}
