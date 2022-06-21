import 'package:flutter/material.dart';

class MenuLogo extends StatelessWidget {
  const MenuLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final LinearGradient gradient = isDark
        ? const LinearGradient(
            colors: [Colors.white, Colors.black], begin: Alignment.topCenter, end: Alignment.bottomCenter)
        : const LinearGradient(
            colors: [Colors.orange, Colors.white], begin: Alignment.topCenter, end: Alignment.bottomCenter);
    const assetName = 'assets/images/drawer-header.png';

    return DrawerHeader(
      decoration: BoxDecoration(
          gradient: gradient,
          image: DecorationImage(invertColors: isDark, fit: BoxFit.contain, image: const AssetImage(assetName))),
      child: const Text(''),
    );
  }
}
