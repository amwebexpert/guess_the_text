import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/screens/game/game_layout_landscape_widget.dart';
import 'package:guess_the_text/screens/game/game_layout_portrait_widget.dart';
import 'package:guess_the_text/model/on_the_fly_chalenge.dart';
import 'package:guess_the_text/screens/game/edit_text_to_guess_widget.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';
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
  final LoggerService logger = LoggerService();
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

  void showAdhocTextDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => const EditTextToGuessDialog());
  }

  void scanQR(BuildContext context) async {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    try {
      final String jsonChallenge =
          await FlutterBarcodeScanner.scanBarcode('#ff6666', localizations.actionCancel, true, ScanMode.DEFAULT);
      final OnTheFlyChalenge onTheFlyChallenge = OnTheFlyChalenge.fromJsonString(jsonChallenge);
      setState(() => {isShuffling = true});
      gameStore.adhocText(onTheFlyChallenge.text, localizations.adhocText);
      Timer(const Duration(milliseconds: 400), () {
        setState(() => {isShuffling = false});
      });
    } catch (e) {
      logger.error('QR Code scan error', e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.appTitle),
      ),
      drawer: AppMenu(onAdhocTextMenuPress: showAdhocTextDialog, onAdhocQRscan: scanQR),
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
