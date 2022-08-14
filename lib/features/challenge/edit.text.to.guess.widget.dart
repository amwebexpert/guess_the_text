import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/features/challenge/on.the.fly.challenge.model.dart';

import 'package:guess_the_text/features/game/game.store.dart';
import 'package:guess_the_text/service.locator.dart';

class EditTextToGuessDialog extends StatefulWidget {
  const EditTextToGuessDialog({Key? key}) : super(key: key);

  @override
  State<EditTextToGuessDialog> createState() => _EditTextToGuessDialogState();
}

class _EditTextToGuessDialogState extends State<EditTextToGuessDialog> {
  final GameStore _gameStore = serviceLocator.get();
  final TextEditingController _textFieldController = TextEditingController();

  bool _isTextHidden = true;
  bool _isTextEmpty = true;

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void toggleHidden() {
    setState(() {
      _isTextHidden = !_isTextHidden;
    });
  }

  void onGenerateQR() {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/onTheFlyChallenge', arguments: OnTheFlyChallenge(text: _textFieldController.text));
    _textFieldController.text = '';
  }

  void onConfirm(String categoryName) {
    Navigator.pop(context);
    _gameStore.adhocText(_textFieldController.text.trim(), categoryName);
    _textFieldController.text = '';
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void onTextUpdated(String value) {
    setState(() {
      _isTextEmpty = _textFieldController.text.trim().isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final Widget icon = _isTextHidden ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off);
    final suffixIcon = IconButton(onPressed: toggleHidden, icon: icon);

    return AlertDialog(
      title: Text(localizations.adhocText),
      content: TextFormField(
        autofocus: true,
        enableSuggestions: false,
        autocorrect: false,
        controller: _textFieldController,
        onChanged: onTextUpdated,
        obscureText: _isTextHidden,
        decoration: InputDecoration(hintText: localizations.adhocTextHint, suffixIcon: suffixIcon),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onCancel,
          child: Text(localizations.actionCancel),
        ),
        ElevatedButton(
          onPressed: _isTextEmpty ? null : () => onConfirm(localizations.adhocText),
          child: Text(localizations.actionOK),
        ),
        ElevatedButton(
          onPressed: _isTextEmpty ? null : onGenerateQR,
          child: Text(localizations.actionGenerateQR),
        ),
      ],
    );
  }
}
