import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/features/game/game_layout_landscape.widget.dart';
import 'package:guess_the_text/features/game/game_layout_portrait.widget.dart';
import 'package:guess_the_text/model/on_the_fly_challenge.model.dart';
import 'package:guess_the_text/features/game/challenge/edit_text_to_guess_widget.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';
import 'package:guess_the_text/features/game/game.store.dart';
import 'package:guess_the_text/widgets/app_bar_title.widget.dart';
import 'package:guess_the_text/utils/extensions/string.extensions.dart';

import '../../widgets/app_menu.widget.dart';
import 'game_layout_landscape.widget.dart';
import 'game_layout_portrait.widget.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  final GameStore gameStore = GameStore();
  final LoggerService logger = LoggerService();
  bool isLoading = false;

  void shuffle(BuildContext context) {
    if (gameStore.currentCategory.isCustom) {
      showDialog(context: context, builder: (context) => const EditTextToGuessDialog());
    } else {
      _delayedWork(gameStore.shuffle);
    }
  }

  void _delayedWork(Function work) {
    try {
      setState(() => {isLoading = true});
      work();
      Timer(const Duration(milliseconds: 400), () {
        setState(() => {isLoading = false});
      });
    } catch (e) {
      logger.error('QR Code scan error', e);
      setState(() => {isLoading = false});
    }
  }

  void showAdhocTextDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => const EditTextToGuessDialog());
  }

  void scanQR(BuildContext context) async {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final cancelLabel = localizations.actionCancel;
    const lineColor = '#ff6666';
    const isShowFlashIcon = true;
    final String jsonChallenge =
        await FlutterBarcodeScanner.scanBarcode(lineColor, cancelLabel, isShowFlashIcon, ScanMode.DEFAULT);

    if (jsonChallenge.isBlank) {
      return;
    }

    _delayedWork(() {
      final OnTheFlyChallenge onTheFlyChallenge = OnTheFlyChallenge.fromJson(jsonChallenge);
      gameStore.adhocText(onTheFlyChallenge.text, localizations.adhocTextHint);
    });
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
            ? GameLayoutPortraitWidget(isLoading: isLoading)
            : GameLayoutLandscapeWidget(isLoading: isLoading);
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () => shuffle(context),
        child: const Icon(Icons.refresh),
        tooltip: 'Shuffle', // TODO translate me i18n
      ),
    );
  }
}