import 'package:flutter/material.dart';

import 'navigation.choices.model.dart';
import 'navigation.landscape.layout.dart';
import 'navigation.portrait.layout.widget.dart';

/// Navigator widget having 2 possible layouts:
/// - render with a `BottomNavigationBar` (portrait)
/// - render with a `NavigationRail` (landscape)
class ResponsiveNavigationRailOrBar extends StatelessWidget {
  final List<NavigationChoices> items;
  final int currentIndex;
  final Widget child;
  final Function(int index) onTap;

  /// Navigator widget using either a `BottomNavigationBar` (portrait) or a `NavigationRail` (landscape)
  ///
  /// Usage within a statefull widget:
  ///
  /// ResponsiveNavigationRailOrBar(items: [
  ///          NavigationChoices(text: 'Cloud', icon: const Icon(Icons.cloud)),
  ///          NavigationChoices(text: 'Device', icon: const Icon(Icons.save_alt)),
  ///        ], currentIndex: _currentIndex, onTap: _onTap, child: _child));
  const ResponsiveNavigationRailOrBar(
      {Key? key,
      required this.items,
      required this.currentIndex,
      required this.child,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? NavigationPortraitLayout(
                  items: items,
                  currentIndex: currentIndex,
                  onTap: onTap,
                  child: child)
              : NavigationLandscapeLayout(
                  items: items,
                  currentIndex: currentIndex,
                  onTap: onTap,
                  child: child);
        },
      );
}
