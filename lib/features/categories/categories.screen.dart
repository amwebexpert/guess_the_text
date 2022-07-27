import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/features/categories/categories.bottom.bar.layout.widget.dart';
import 'package:guess_the_text/features/categories/categories.nav.rail.layout.widget.dart';
import 'package:guess_the_text/theme/widgets/app.bar.title.widget.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: AppLocalizations.of(context)!.categories),
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? const CategoriesBottomBarWidget()
                : const CategoriesNavRailWidget();
          },
        ));
  }
}
