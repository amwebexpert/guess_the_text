import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'features/settings/settings.store.dart';
import 'route.generator.dart';
import 'service.locator.dart';
import 'services/assets/asset.locator.service.dart';
import 'services/logger/logger.service.dart';
import 'services/storage/shared.preferences.enum.dart';
import 'services/storage/shared.preferences.services.dart';
import 'services/text.service/api.category.model.dart';
import 'services/text.service/api.texts.service.dart';
import 'theme/app.theme.dart';
import 'theme/widgets/app.error.widget.dart';
import 'utils/animation.utils.dart';
import 'utils/randomizer.utils.dart';

void main() {
  if (!kDebugMode) {
    ErrorWidget.builder = (FlutterErrorDetails details) => AppErrorWidget(details: details);
  }
  debugRepaintRainbowEnabled = false;

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const HangmanApp());
  }, (error, stackTrace) {
    LoggerService().error('unhandled error occured in root zone', error: error, stackTrace: stackTrace);
  });
}

class HangmanApp extends StatefulWidget {
  const HangmanApp({Key? key}) : super(key: key);

  @override
  State<HangmanApp> createState() => _HangmanAppState();
}

class _HangmanAppState extends State<HangmanApp> {
  bool _isAppLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final serviceLocator = await initServiceLocator();
    final AssetLocatorService assetLocatorService = serviceLocator.get();

    await Future.wait([
      loadTexts(),

      // prefetch game images so they are displayed without lagging
      precachePicture(assetLocatorService.getPicture('hangman-happy'), null),
      precachePicture(assetLocatorService.getPicture('hangman-01'), null),
    ]);

    // ensure the widget was not removed from the tree while the asynchronous call was in flight
    if (mounted) {
      setState(() => _isAppLoading = false);
    }
  }

  Future<void> loadTexts() async {
    final TextsService textsService = serviceLocator.get<TextsService>();
    final SharedPreferencesService preferences = serviceLocator.get();

    List<ApiCategory> categories = await textsService.getCategories();
    String lastSelectedCategoryUuid =
        preferences.getString(SharedPreferenceKey.lastSelectedCategory.name, defaultValue: categories.first.uuid);
    await textsService.getTexts(lastSelectedCategoryUuid);
  }

  @override
  Widget build(BuildContext context) {
    if (_isAppLoading) {
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
