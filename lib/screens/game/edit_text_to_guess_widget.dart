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
  bool isTextEmpty = true;

  void toggleHidden() {
    setState(() {
      isTextHidden = !isTextHidden;
    });
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
      ],
    );
  }
}
