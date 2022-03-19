import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/utils/icon_utils.dart';

class AppMenu extends StatelessWidget {
  final Function() resetState;

  const AppMenu({
    Key? key,
    required this.resetState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Container(
        color: Colors.orange[700],
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.contain, image: AssetImage('assets/images/drawer-header.png'))),
              child: Text(''),
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              leading: Icon(
                iconsMap['categories'],
                color: Colors.white,
              ),
              title: Text(
                localizations.categories,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/categories').then((value) {
                  if (value != null) {
                    print('new category: $value');
                    resetState();
                  }
                });
              },
            ),
            const Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              leading: Icon(
                iconsMap['info'],
                color: Colors.white,
              ),
              title: Text(
                localizations.about,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            const Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
