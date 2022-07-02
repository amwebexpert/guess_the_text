import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobx/mobx.dart';

import '/features/game/challenge/edit.text.to.guess.widget.dart';
import '/features/game/challenge/on.the.fly.challenge.model.dart';
import '/features/game/game.fab.widget.dart';
import '/features/game/game.layout.landscape.widget.dart';
import '/features/game/game.layout.portrait.widget.dart';
import '/features/game/game.store.dart';
import '/service.locator.dart';
import '/services/logger/logger.service.dart';
import '/services/qr/qr.code.service.dart';
import '/store/fixed.delay.spinner.store.dart';
import '/store/store.state.enum.dart';
import '/theme/widgets/app.bar.title.widget.dart';
import '/theme/widgets/app.menu.widget.dart';
import '/theme/widgets/snackbar/snackbar.model.dart';
import '/theme/widgets/snackbar/snackbar.utils.dart';
import '/utils/extensions/string.extensions.dart';
import 'game.layout.landscape.widget.dart';
import 'game.layout.portrait.widget.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  final GameStore _gameStore = serviceLocator.get();
  final QrCodeService _qrCodeService = serviceLocator.get();
  final FixedDelaySpinnerStore _spinnerStore = serviceLocator.get();
  final LoggerService _logger = serviceLocator.get();

  final List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    super.initState();

    final ReactionDisposer disposer = reaction((_) => _spinnerStore.state, (StoreState storeState) {
      _logger.info('Example of a reaction on spinnerStore.state change $storeState');
    });
    _disposers.add(disposer);
  }

  @override
  void dispose() {
    for (var disposer in _disposers) {
      disposer();
    }

    super.dispose();
  }

  void shuffle() {
    if (_gameStore.currentCategory.isCustom) {
      onCreateChallengePress();
    } else {
      _spinnerStore.spin(milliseconds: 400);
      _gameStore.shuffle();
    }
  }

  void onCreateChallengePress() {
    showDialog(context: context, builder: (context) => const EditTextToGuessDialog());
  }

  void onAcceptChallengePress() async {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final String jsonChallenge = await _qrCodeService.scan(cancelLabel: localizations.actionCancel);

    if (jsonChallenge.isBlank) {
      showAppSnackbar(context: context, message: localizations.acceptChallengeCancelled, type: SnackbarType.info);
      return;
    }

    _spinnerStore.spin(milliseconds: 400);
    final OnTheFlyChallenge onTheFlyChallenge = OnTheFlyChallenge.fromJson(jsonChallenge);
    _gameStore.adhocText(onTheFlyChallenge.text, localizations.adhocTextHint);
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
