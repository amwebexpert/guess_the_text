import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '/features/settings/settings.store.dart';
import '/route.generator.dart';
import '/service.locator.dart';
import '/theme/app.theme.dart';
import '/theme/widgets/app.error.widget.dart';
import '/utils/animation.utils.dart';
import '/utils/randomizer.utils.dart';
import 'services/text.service/api.category.model.dart';
import 'services/text.service/api.texts.service.dart';

void main() {
  if (!kDebugMode) {
    ErrorWidget.builder = (FlutterErrorDetails details) => AppErrorWidget(details: details);
  }
  // debugRepaintRainbowEnabled = true;
  runApp(const HangmanApp());
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
    final TextsService textsService = serviceLocator.get<TextsService>();

    List<ApiCategory> categories = await textsService.getCategories();

    Future.wait([
      textsService.getTexts(categories.first.uuid),
      // prefetch game images so they are displayed without lagging
      precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, 'assets/images/hangman-happy.svg'), null),
      precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, 'assets/images/hangman-01.svg'), null),
    ]);

    // If the widget was removed from the tree while the asynchronous call was in flight
    if (!mounted) {
      return;
    }

    setState(() {
      _isAppLoading = false;
    });
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
