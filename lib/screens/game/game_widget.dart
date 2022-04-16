import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/screens/game/game_layout_landscape_widget.dart';
import 'package:guess_the_text/screens/game/game_layout_portrait_widget.dart';
import 'package:guess_the_text/store/game/game.store.dart';
import 'package:guess_the_text/theme/app_bar/app_bar_title_widget.dart';

import 'app-menu/app_menu_widget.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  final GameStore gameStore = GameStore();
  bool isShuffling = false;

  void shuffle() {
    setState(() => {isShuffling = true});

    Timer(const Duration(milliseconds: 400), () {
      gameStore.shuffle();
      setState(() => {isShuffling = false});
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.appTitle),
      ),
      drawer: AppMenu(resetState: shuffle),
      body: OrientationBuilder(builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? GameLayoutPortraitWidget(isShuffling: isShuffling)
            : GameLayoutLandscapeWidget(isShuffling: isShuffling);
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: shuffle,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
