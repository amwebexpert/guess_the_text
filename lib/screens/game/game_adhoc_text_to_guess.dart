import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/store/game/game.store.dart';

Future<void> showAdhocTextDialog(BuildContext context) async {
  final GameStore gameStore = GameStore();
  final AppLocalizations localizations = AppLocalizations.of(context)!;
  final TextEditingController textFieldController = TextEditingController();

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(localizations.adhocText),
          content: TextField(
            controller: textFieldController,
            decoration: InputDecoration(hintText: localizations.adhocTextHint),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(localizations.actionCancel),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: Text(localizations.actionOK),
              onPressed: () {
                Navigator.pop(context);
                gameStore.adhocText(textFieldController.text);
                textFieldController.text = '';
              },
            ),
          ],
        );
      });
}
