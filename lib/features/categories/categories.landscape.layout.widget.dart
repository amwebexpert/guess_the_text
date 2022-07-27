import 'package:flutter/material.dart';
import 'package:guess_the_text/features/categories/local/local.categories.widget.dart';
import 'package:guess_the_text/features/categories/remote/remote.categories.widget.dart';

class CategoriesLandscapeWidget extends StatefulWidget {
  const CategoriesLandscapeWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesLandscapeWidget> createState() => _CategoriesLandscapeWidgetState();
}

class _CategoriesLandscapeWidgetState extends State<CategoriesLandscapeWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        NavigationRail(
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          destinations: const [
            NavigationRailDestination(
                icon: Icon(Icons.cloud), label: Text('Public server categories')), // TODO Translate me
            NavigationRailDestination(
                icon: Icon(Icons.save_alt), label: Text('Private device categories')) // TODO Translate me
          ],
          labelType: NavigationRailLabelType.all,
        ),
        Expanded(child: _selectedIndex == 0 ? const RemoteCategoriesWidget() : const LocalCategoriesWidget())
      ],
    );
  }
}
