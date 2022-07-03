import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MadeWithLoveWidget extends StatelessWidget {
  const MadeWithLoveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Column(
      children: [
        const FlutterLogo(
          size: 100,
          style: FlutterLogoStyle.horizontal,
        ),
        Text(
          localizations.aboutMadeWithLove,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
