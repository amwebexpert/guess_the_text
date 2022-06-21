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
      title: const HeaderlineWidget(),
      subtitle: Text(
        localizations.appSubTitle,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}

class HeaderlineWidget extends StatelessWidget {
  const HeaderlineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          localizations.appTitle,
          textStyle: Theme.of(context).textTheme.headline5!.copyWith(
            decoration: TextDecoration.combine([
              TextDecoration.overline,
              TextDecoration.underline,
            ]),
            decorationThickness: 1,
            decorationStyle: TextDecorationStyle.dotted,
            shadows: [
              Shadow(
                color: Theme.of(context).colorScheme.primary,
                blurRadius: 2,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          speed: const Duration(milliseconds: 200),
        ),
      ],
      totalRepeatCount: 4,
      pause: const Duration(milliseconds: 1000),
      displayFullTextOnTap: true,
      stopPauseOnTap: true,
    );
  }
}
