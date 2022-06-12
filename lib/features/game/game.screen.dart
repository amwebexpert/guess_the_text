import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/features/game/game.fab.widget.dart';
import 'package:guess_the_text/features/game/game.layout.landscape.widget.dart';
import 'package:guess_the_text/features/game/game.layout.portrait.widget.dart';
import 'package:guess_the_text/features/game/challenge/on.the.fly.challenge.model.dart';
import 'package:guess_the_text/features/game/challenge/edit.text.to.guess.widget.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';
import 'package:guess_the_text/features/game/game.store.dart';
import 'package:guess_the_text/services/qr/qr.code.service.dart';
import 'package:guess_the_text/store/fixed.delay.spinner.store.dart';
import 'package:guess_the_text/store/store.state.enum.dart';
import 'package:guess_the_text/theme/widgets/app.bar.title.widget.dart';
import 'package:guess_the_text/theme/widgets/app.menu.widget.dart';
import 'package:guess_the_text/theme/widgets/snackbar/snackbar.model.dart';
import 'package:guess_the_text/theme/widgets/snackbar/snackbar.utils.dart';
import 'package:guess_the_text/utils/extensions/string.extensions.dart';
import 'package:mobx/mobx.dart';

import 'game.layout.landscape.widget.dart';
import 'game.layout.portrait.widget.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  final GameStore gameStore = serviceLocator.get();
  final QrCodeService qrCodeService = serviceLocator.get();
  final FixedDelaySpinnerStore spinnerStore = serviceLocator.get();
  final LoggerService logger = serviceLocator.get();

  final List<ReactionDisposer> disposers = [];

  @override
  void initState() {
    super.initState();

    final ReactionDisposer disposer = reaction((_) => spinnerStore.state, (StoreState storeState) {
      logger.info('Example of a reaction on spinnerStore.state change $storeState');
    });
    disposers.add(disposer);
  }

  @override
  void dispose() {
    for (var disposer in disposers) {
      disposer();
    }

    super.dispose();
  }

  void shuffle() {
    if (gameStore.currentCategory.isCustom) {
      onCreateChallengePress();
    } else {
      spinnerStore.spin(milliseconds: 400);
      gameStore.shuffle();
    }
  }

  void onCreateChallengePress() {
    showDialog(context: context, builder: (context) => const EditTextToGuessDialog());
  }

  void onAcceptChallengePress() async {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final String jsonChallenge = await qrCodeService.scan(cancelLabel: localizations.actionCancel);

    if (jsonChallenge.isBlank) {
      showAppSnackbar(context: context, message: localizations.acceptChallengeCancelled, type: SnackbarType.info);
      return;
    }

    spinnerStore.spin(milliseconds: 400);
    final OnTheFlyChallenge onTheFlyChallenge = OnTheFlyChallenge.fromJson(jsonChallenge);
    gameStore.adhocText(onTheFlyChallenge.text, localizations.adhocTextHint);
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.appTitle),
      ),
      drawer: Drawer(
          child:
              AppMenu(onCreateChallengePress: onCreateChallengePress, onAcceptChallengePress: onAcceptChallengePress)),
      body: OrientationBuilder(builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? const GameLayoutPortraitWidget()
            : const GameLayoutLandscapeWidget();
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: GameFabWidget(onPressed: shuffle),
    );
  }
}
