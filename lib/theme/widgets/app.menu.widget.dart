import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/theme/widgets/app.menu.item.widget.dart';
import 'package:guess_the_text/theme/widgets/menu.logo.widget.dart';

class AppMenu extends StatelessWidget {
  final Function() onCreateChallengePress;
  final Function() onAcceptChallengePress;

  const AppMenu({
    Key? key,
    required this.onCreateChallengePress,
    required this.onAcceptChallengePress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        const MenuLogo(),
        MenuItemWidget(
          titleLabel: localizations.categories,
          iconName: 'categories',
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/categories');
          },
        ),
        const Divider(thickness: 2),
        MenuItemWidget(
          titleLabel: localizations.adhocText,
          iconName: 'adhoc',
          onTap: () {
            Navigator.pop(context);
            onCreateChallengePress();
          },
        ),
        const Divider(thickness: 2),
        MenuItemWidget(
          titleLabel: localizations.appMenuReadChalenge,
          iconName: 'adhocScan',
          onTap: () {
            Navigator.pop(context);
            onAcceptChallengePress();
          },
        ),
        const Divider(thickness: 2),
        MenuItemWidget(
          titleLabel: localizations.preferences,
          iconName: 'preferences',
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/settings');
          },
        ),
        const Divider(thickness: 2),
        MenuItemWidget(
          titleLabel: localizations.about,
          iconName: 'info',
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/about');
          },
        ),
        const Divider(thickness: 2),
      ],
    );
  }
}
