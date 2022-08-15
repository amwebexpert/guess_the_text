import 'package:flutter/material.dart';
import 'navigation.choices.model.dart';

class NavigationPortraitLayout extends StatelessWidget {
  final int currentIndex;
  final List<NavigationChoices> items;
  final ValueChanged<int> onTap;
  final Widget child;

  const NavigationPortraitLayout(
      {Key? key, required this.currentIndex, required this.onTap, required this.items, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          items: items.map((it) => BottomNavigationBarItem(icon: it.icon, label: it.text)).toList(),
        ),
      );
}
