import 'package:flutter/material.dart';
import 'package:guess_the_text/store/game/game.store.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditTextToGuessDialog extends StatefulWidget {
  const EditTextToGuessDialog({Key? key}) : super(key: key);

  @override
  _EditTextToGuessDialogState createState() => _EditTextToGuessDialogState();
}

class _EditTextToGuessDialogState extends State<EditTextToGuessDialog> {
  final GameStore gameStore = GameStore();
  final TextEditingController textFieldController = TextEditingController();
  bool isTextHidden = true;

  void toggleHidden() {
    setState(() {
      isTextHidden = !isTextHidden;
    });
  }

  void onConfirm() {
    Navigator.pop(context);
    gameStore.adhocText(textFieldController.text);
    textFieldController.text = '';
  }

  void onCancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(localizations.adhocText),
      content: TextField(
        controller: textFieldController,
        obscureText: isTextHidden,
        decoration: InputDecoration(
            hintText: localizations.adhocTextHint,
            suffixIcon: IconButton(
                onPressed: toggleHidden,
                icon: isTextHidden ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off))),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(localizations.actionCancel),
          onPressed: onCancel,
        ),
        ElevatedButton(
          child: Text(localizations.actionOK),
          onPressed: onConfirm,
        ),
      ],
    );
  }
}
