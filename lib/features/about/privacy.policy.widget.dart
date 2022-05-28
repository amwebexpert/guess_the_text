import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/theme/widgets/text.link.widget.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return ThemedTextLink(
        displayText: localizations.privacyPolicy,
        hyperlink: 'https://amw-hangman-api.herokuapp.com/privacy-policy.html'); // TODO dot env config
  }
}
