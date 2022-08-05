import 'package:flutter/material.dart';
import 'package:guess_the_text/theme/widgets/responsive/navigation/navigation.choices.model.dart';

class NavigationLandscapeLayout extends StatelessWidget {
  final int currentIndex;
  final List<NavigationChoices> items;
  final ValueChanged<int> onTap;
  final Widget child;

  const NavigationLandscapeLayout(
      {Key? key, required this.currentIndex, required this.onTap, required this.items, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        NavigationRail(
          selectedIndex: currentIndex,
          onDestinationSelected: onTap,
          destinations: items.map((it) => NavigationRailDestination(icon: it.icon, label: Text(it.text))).toList(),
          labelType: NavigationRailLabelType.all,
        ),
        Expanded(child: child)
      ],
    );
  }
}
