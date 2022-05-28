import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardAppDescriptionWidget extends StatelessWidget {
  const CardAppDescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Text(
      localizations.appDescription,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
