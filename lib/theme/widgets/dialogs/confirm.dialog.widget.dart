import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showConfirmDialog(
    {required BuildContext context,
    required String title,
    required String body,
    VoidCallback? onCancel,
    required VoidCallback onConfirm}) {
  final AppLocalizations localizations = AppLocalizations.of(context)!;

  showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: [
            TextButton(
                onPressed: () {
                  onCancel?.call();
                  Navigator.of(context).pop();
                },
                child: Text(localizations.actionCancel)),
            ElevatedButton(
                onPressed: () {
                  onConfirm();
                  Navigator.of(context).pop();
                },
                child: Text(localizations.actionOK)),
          ],
        );
      });
}
