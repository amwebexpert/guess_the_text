import 'package:flutter/material.dart';
import 'package:guess_the_text/features/game/challenge/on_the_fly_challenge.model.dart';
import 'package:guess_the_text/features/game/game.store.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/service.locator.dart';

class EditTextToGuessDialog extends StatefulWidget {
  const EditTextToGuessDialog({Key? key}) : super(key: key);

  @override
  _EditTextToGuessDialogState createState() => _EditTextToGuessDialogState();
}

class _EditTextToGuessDialogState extends State<EditTextToGuessDialog> {
  final GameStore gameStore = serviceLocator.get();
  final TextEditingController textFieldController = TextEditingController();

  bool isTextHidden = true;
  bool isTextEmpty = true;

  void toggleHidden() {
    setState(() {
      isTextHidden = !isTextHidden;
    });
  }

  void onGenerateQR() {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/onTheFlyChallenge', arguments: OnTheFlyChallenge(text: textFieldController.text));
    textFieldController.text = '';
  }

  void onConfirm(String categoryName) {
    Navigator.pop(context);
    gameStore.adhocText(textFieldController.text.trim(), categoryName);
    textFieldController.text = '';
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void onTextUpdated(String value) {
    setState(() {
      isTextEmpty = textFieldController.text.trim().isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final Widget icon = isTextHidden ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off);
    final suffixIcon = IconButton(onPressed: toggleHidden, icon: icon);

    return AlertDialog(
      title: Text(localizations.adhocText),
      content: TextFormField(
        autofocus: true,
        enableSuggestions: false,
        autocorrect: false,
        controller: textFieldController,
        onChanged: onTextUpdated,
        obscureText: isTextHidden,
        decoration: InputDecoration(hintText: localizations.adhocTextHint, suffixIcon: suffixIcon),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(localizations.actionCancel),
          onPressed: onCancel,
        ),
        ElevatedButton(
          child: Text(localizations.actionOK),
          onPressed: isTextEmpty ? null : () => onConfirm(localizations.adhocText),
        ),
        ElevatedButton(
          child: Text(localizations.actionGenerateQR),
          onPressed: isTextEmpty ? null : onGenerateQR,
        ),
      ],
    );
  }
}
