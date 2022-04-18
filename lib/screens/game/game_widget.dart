import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/screens/game/game_layout_landscape_widget.dart';
import 'package:guess_the_text/screens/game/game_layout_portrait_widget.dart';
import 'package:guess_the_text/screens/game/edit_text_to_guess_widget.dart';
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

  void shuffle(BuildContext context) {
    if (gameStore.currentCategory.isCustom) {
      showDialog(context: context, builder: (context) => const EditTextToGuessDialog());
    } else {
      setState(() => {isShuffling = true});
      gameStore.shuffle();
      Timer(const Duration(milliseconds: 400), () {
        setState(() => {isShuffling = false});
      });
    }
  }

  showAdhocTextDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => const EditTextToGuessDialog());
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.appTitle),
      ),
      drawer: AppMenu(onAdhocTextMenuPress: showAdhocTextDialog),
      body: OrientationBuilder(builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? GameLayoutPortraitWidget(isShuffling: isShuffling)
            : GameLayoutLandscapeWidget(isShuffling: isShuffling);
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () => shuffle(context),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
