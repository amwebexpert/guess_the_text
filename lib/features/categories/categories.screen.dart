import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../service.locator.dart';
import '../../services/logger/logger.service.dart';
import '../../services/storage/shared.preferences.enum.dart';
import '../../services/storage/shared.preferences.services.dart';
import '../../theme/widgets/app.bar.title.widget.dart';
import '../../theme/widgets/responsive/navigation/navigation.choices.model.dart';
import '../../theme/widgets/responsive/navigation/responsive.navigation.rail.or.bar.widget.dart';
import 'local/local.categories.widget.dart';
import 'remote/remote.categories.widget.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  final SharedPreferencesService preferences = serviceLocator.get();
  final LoggerService loggerService = serviceLocator.get();

  late int _currentIndex;
  late Widget _child;

  @override
  void initState() {
    super.initState();
    _currentIndex = preferences.getInt(SharedPreferenceKey.lastSelectedCategoriesListType.name, defaultValue: 0);
    _child = _computeChild(_currentIndex);
  }

  Widget _computeChild(int index) {
    switch (index) {
      case 0:
        return const RemoteCategoriesWidget();
      case 1:
        return const LocalCategoriesWidget();

      default:
        loggerService.error('unhandled child index $index, returning default');
        return const RemoteCategoriesWidget();
    }
  }

  void _onTap(int index) {
    preferences.setInt(SharedPreferenceKey.lastSelectedCategoriesListType.name, index);

    setState(() {
      _child = _computeChild(index);
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: localizations.categories),
        ),
        body: ResponsiveNavigationRailOrBar(items: [
          NavigationChoices(text: localizations.categoryTypeCloud, icon: const Icon(Icons.cloud)),
          NavigationChoices(text: localizations.categoryTypeDevice, icon: const Icon(Icons.save_alt)),
        ], currentIndex: _currentIndex, onTap: _onTap, child: _child));
  }
}
