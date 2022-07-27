import 'package:flutter/material.dart';
import 'package:guess_the_text/features/categories/local/local.categories.widget.dart';
import 'package:guess_the_text/features/categories/remote/remote.categories.widget.dart';

class CategoriesNavRailWidget extends StatefulWidget {
  const CategoriesNavRailWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesNavRailWidget> createState() => _CategoriesNavRailWidgetState();
}

class _CategoriesNavRailWidgetState extends State<CategoriesNavRailWidget> {
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
            NavigationRailDestination(icon: Icon(Icons.cloud), label: Text('Public server categories')),
            NavigationRailDestination(icon: Icon(Icons.save_alt), label: Text('Private device categories'))
          ],
          labelType: NavigationRailLabelType.all,
        ),
        Expanded(child: _selectedIndex == 0 ? const RemoteCategoriesWidget() : const LocalCategoriesWidget())
      ],
    );
  }
}
