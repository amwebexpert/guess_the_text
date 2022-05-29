import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/utils/icon.utils.dart';
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

    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const MenuLogo(),
          ListTile(
            visualDensity: VisualDensity.compact,
            leading: Icon(
              iconsMap['categories'],
            ),
            title: Text(localizations.categories, style: Theme.of(context).textTheme.bodyText1),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/categories');
            },
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            visualDensity: VisualDensity.compact,
            leading: Icon(
              iconsMap['adhoc'],
            ),
            title: Text(localizations.adhocText, style: Theme.of(context).textTheme.bodyText1),
            onTap: () {
              Navigator.pop(context);
              onCreateChallengePress();
            },
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            visualDensity: VisualDensity.compact,
            leading: Icon(
              iconsMap['adhocScan'],
            ),
            title: Text(localizations.appMenuReadChalenge, style: Theme.of(context).textTheme.bodyText1),
            onTap: () {
              Navigator.pop(context);
              onAcceptChallengePress();
            },
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            visualDensity: VisualDensity.compact,
            leading: Icon(
              iconsMap['preferences'],
            ),
            title: Text(
              localizations.preferences,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            },
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            visualDensity: VisualDensity.compact,
            leading: Icon(
              iconsMap['info'],
            ),
            title: Text(
              localizations.about,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/about');
            },
          ),
          const Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
