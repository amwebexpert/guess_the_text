import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../service.locator.dart';
import '../../services/assets/asset.locator.service.dart';

class MadeWithLoveWidget extends StatelessWidget {
  final String appIcon = serviceLocator.get<AssetLocatorService>().imagePath('drawer-header');
  MadeWithLoveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () => showAboutDialog(
        context: context,
        applicationIcon: SvgPicture.asset(appIcon, height: 48, color: Theme.of(context).colorScheme.primary),
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
