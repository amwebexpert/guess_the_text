import 'package:flutter/material.dart';

import 'navigation.choices.model.dart';
import 'navigation.landscape.layout.dart';
import 'navigation.portrait.layout.widget.dart';

class ResponsiveNavigationRailOrBar extends StatelessWidget {
  final List<NavigationChoices> items;
  final int currentIndex;
  final Widget child;
  final Function(int index) onTap;

  const ResponsiveNavigationRailOrBar({Key? key, required this.items, required this.currentIndex, required this.child, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) => OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? NavigationPortraitLayout(items: items, currentIndex: currentIndex, onTap: onTap, child: child)
              : NavigationLandscapeLayout(items: items, currentIndex: currentIndex, onTap: onTap, child: child);
        },
      );
}
