import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/screens/about/about_app_version_table.dart';
import 'package:guess_the_text/screens/about/about_platform_info_table.dart';
import 'package:guess_the_text/screens/loading/animations.dart';
import 'package:guess_the_text/theme/text_link.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Card(
      color: Theme.of(context).colorScheme.secondaryContainer,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.info_outline_rounded),
                title: Text(localizations.appTitle),
                subtitle: Text(
                  localizations.appSubTitle,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: 200,
                    child: Center(
                      child: Lottie.asset(getAnimationPath()),
                    )),
              ),
              ThemedTextLink(
                  displayText: localizations.privacyPolicy,
                  hyperlink: 'https://amw-hangman-api.herokuapp.com/privacy-policy.html'),
              const AppVersionTable(),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 24, 8, 10),
                child: Text(
                  localizations.appDescription,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: PlatformInfoTable(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
