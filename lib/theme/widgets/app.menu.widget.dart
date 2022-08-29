import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/theme/widgets/app.menu.item.widget.dart';
import '/theme/widgets/menu.logo.widget.dart';
import '../../service.locator.dart';
import '../../services/qr/qr.code.service.dart';

class AppMenu extends StatelessWidget {
  final Function() onCreateChallengePress;
  final Function() onAcceptChallengePress;

  const AppMenu({Key? key, required this.onCreateChallengePress, required this.onAcceptChallengePress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final QrCodeService qrCodeService = serviceLocator.get();

    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        MenuLogo(),
        MenuItemWidget(
          titleLabel: localizations.categories,
          iconName: 'categories',
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/categories');
          },
        ),
        MenuItemWidget(
          titleLabel: localizations.adhocText,
          iconName: 'adhoc',
          onTap: () {
            Navigator.pop(context);
            onCreateChallengePress();
          },
        ),
        if (qrCodeService.isScanOperationSupported())
          MenuItemWidget(
            titleLabel: localizations.appMenuReadChalenge,
            iconName: 'adhocScan',
            onTap: () {
              Navigator.pop(context);
              onAcceptChallengePress();
            },
          ),
        MenuItemWidget(
          titleLabel: localizations.preferences,
          iconName: 'preferences',
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/settings');
          },
        ),
        MenuItemWidget(
          titleLabel: localizations.about,
          iconName: 'info',
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/about');
          },
        ),
      ],
    );
  }
}
