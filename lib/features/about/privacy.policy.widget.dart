import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/theme/widgets/text.link.widget.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return ThemedTextLink(
        displayText: localizations.privacyPolicy,
        hyperlink: 'https://amwebexpert.github.io/etoolbox/privacy-policy.html'); // TODO dot env config
  }
}
