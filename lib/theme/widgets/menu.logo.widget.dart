import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guess_the_text/theme/theme.utils.dart';

class MenuLogo extends StatelessWidget {
  const MenuLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    const assetName = 'assets/images/drawer-header.svg';

    return DrawerHeader(
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: SvgPicture.asset(
                assetName,
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
