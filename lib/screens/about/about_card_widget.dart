import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/screens/about/about_app_version_table.dart';
import 'package:guess_the_text/screens/about/about_platform_info_table.dart';
import 'package:guess_the_text/screens/loading/animations.dart';
import 'package:guess_the_text/theme/text_link.dart';
import 'package:guess_the_text/theme/theme_utils.dart';
import 'package:lottie/lottie.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.all(spacing(2)),
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
                padding: EdgeInsets.all(spacing(1)),
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
    );
  }
}
