import 'package:flutter/material.dart';

class MenuLogo extends StatelessWidget {
  final bool isDark;

  const MenuLogo({
    Key? key,
    required this.isDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const assetName = 'assets/images/drawer-header.png';

    return DrawerHeader(
      decoration: BoxDecoration(
          image: DecorationImage(invertColors: isDark, fit: BoxFit.contain, image: const AssetImage(assetName))),
      child: const Text(''),
    );
  }
}
