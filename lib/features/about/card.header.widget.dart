import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class CardHeaderWidget extends StatelessWidget {
  const CardHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return ListTile(
      leading: const Icon(Icons.info_outline_rounded),
      title: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            localizations.appTitle,
            textStyle: Theme.of(context).textTheme.bodyText1,
            speed: const Duration(milliseconds: 200),
          ),
        ],
        totalRepeatCount: 4,
        pause: const Duration(milliseconds: 1000),
        displayFullTextOnTap: true,
        stopPauseOnTap: true,
      ),
      subtitle: Text(
        localizations.appSubTitle,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
