import 'package:flutter/material.dart';
import 'navigation.choices.model.dart';
import 'navigation.landscape.layout.dart';
import 'navigation.portrait.layout.widget.dart';

class ResponsiveNavigationRailOrBar extends StatefulWidget {
  final List<NavigationChoices> items;
  final int currentIndex;
  final Widget Function(int index) childBuilder;

  const ResponsiveNavigationRailOrBar(
      {Key? key, required this.items, required this.childBuilder, this.currentIndex = 0})
      : super(key: key);

  @override
  State<ResponsiveNavigationRailOrBar> createState() => _ResponsiveNavigationRailOrBarState();
}

class _ResponsiveNavigationRailOrBarState extends State<ResponsiveNavigationRailOrBar> {
  late int currentIndex;
  late Widget child;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
    child = widget.childBuilder(widget.currentIndex);
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
      child = widget.childBuilder(index);
    });
  }

  @override
  Widget build(BuildContext context) => OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? NavigationPortraitLayout(items: widget.items, currentIndex: currentIndex, onTap: onTap, child: child)
              : NavigationLandscapeLayout(items: widget.items, currentIndex: currentIndex, onTap: onTap, child: child);
        },
      );
}
