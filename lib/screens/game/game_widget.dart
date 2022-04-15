import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guess_the_text/screens/game/game_layout_landscape_widget.dart';
import 'package:guess_the_text/screens/game/game_layout_portrait_widget.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';
import 'package:guess_the_text/store/game/game.store.dart';
import 'package:guess_the_text/theme/app_bar/app_bar_title_widget.dart';

import 'app-menu/app_menu_widget.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  final LoggerService logger = LoggerService();
  final GameStore gameStore = GameStore();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Observer(builder: (BuildContext context) {
      logger.info('GameWidget build ${gameStore.interactions}');

      return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: localizations.appTitle),
        ),
        drawer: AppMenu(resetState: gameStore.shuffle),
        body: OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.portrait ? GameLayoutPortraitWidget() : GameLayoutLandscapeWidget();
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: FloatingActionButton(
          onPressed: gameStore.shuffle,
          child: const Icon(Icons.refresh),
        ),
      );
    });
  }
}
