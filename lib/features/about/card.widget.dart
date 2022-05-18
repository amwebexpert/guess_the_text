import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/utils/animation.utils.dart';
import 'package:guess_the_text/widgets/text_link.widget.dart';
import 'package:guess_the_text/theme/theme.utils.dart';
import 'package:guess_the_text/utils/randomizer.utils.dart';
import 'package:lottie/lottie.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

import 'app_version_table.widget.dart';
import 'platform_info_table.widget.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Opacity(
      opacity: 0.9,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.all(spacing(2)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
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
                ),
                Padding(
                  padding: EdgeInsets.all(spacing(1)),
                  child: SizedBox(
                      width: 200,
                      child: Center(
                        child: Lottie.asset(AnimationUtils(RandomizerUtils()).getAnimationPath()),
                      )),
                ),
                ThemedTextLink(
                    displayText: localizations.privacyPolicy,
                    hyperlink: 'https://amw-hangman-api.herokuapp.com/privacy-policy.html'),
                const AppVersionTable(),
                Padding(
                  padding: EdgeInsets.fromLTRB(spacing(1), spacing(3), spacing(1), spacing(1.25)),
                  child: Text(
                    localizations.appDescription,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(spacing(1)),
                  child: const PlatformInfoTable(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
