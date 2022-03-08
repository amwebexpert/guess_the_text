import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppMenu extends StatelessWidget {
  final Function() resetState;

  const AppMenu({
    Key? key,
    required this.resetState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context)!;

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
              title: Text(
                localizations.categories,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'IndieFlower',
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
            ListTile(
              title: Text(
                localizations.about,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'IndieFlower',
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
    );
  }
}
