import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/theme/theme.utils.dart';

class MenuLogo extends StatelessWidget {
  const MenuLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color color = isDark ? Colors.white : Colors.black;
    const assetName = 'assets/images/drawer-header.png';

    return DrawerHeader(
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
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
