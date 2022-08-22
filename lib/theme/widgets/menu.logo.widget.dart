import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/theme/theme.utils.dart';
import '../../service.locator.dart';
import '../../services/assets/asset.locator.service.dart';

class MenuLogo extends StatelessWidget {
  final String menuLogo = serviceLocator.get<AssetLocatorService>().imagePath('drawer-header');
  MenuLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return DrawerHeader(
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: SvgPicture.asset(
                menuLogo,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: spacing(1)),
            Text(
              localizations.appTitle,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
