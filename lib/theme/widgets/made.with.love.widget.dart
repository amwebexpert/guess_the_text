import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MadeWithLoveWidget extends StatelessWidget {
  const MadeWithLoveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    const assetName = 'assets/images/drawer-header.svg';

    return GestureDetector(
      onTap: () => showAboutDialog(
        context: context,
        applicationIcon: SvgPicture.asset(assetName, height: 48, color: Theme.of(context).colorScheme.primary),
        applicationName: localizations.appTitle,
        applicationLegalese: localizations.appSubTitle,
      ),
      child: Column(
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
      ),
    );
  }
}
