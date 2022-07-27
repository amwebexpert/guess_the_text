import 'package:flutter/material.dart';
import 'package:guess_the_text/features/categories/local/local.categories.widget.dart';
import 'package:guess_the_text/features/categories/remote/remote.categories.widget.dart';

class CategoriesBottomBarWidget extends StatefulWidget {
  const CategoriesBottomBarWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesBottomBarWidget> createState() => _CategoriesBottomBarWidgetState();
}

class _CategoriesBottomBarWidgetState extends State<CategoriesBottomBarWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0 ? const RemoteCategoriesWidget() : const LocalCategoriesWidget(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Public server categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save_alt),
            label: 'Private device categories',
          ),
        ],
      ),
    );
  }
}
