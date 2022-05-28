import 'package:flutter/material.dart';

class MenuLogo extends StatelessWidget {
  const MenuLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    const assetName = 'assets/images/drawer-header.png';

    return DrawerHeader(
      decoration: BoxDecoration(
          image: DecorationImage(invertColors: isDark, fit: BoxFit.contain, image: const AssetImage(assetName))),
      child: const Text(''),
    );
  }
}
