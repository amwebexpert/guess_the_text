import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/features/categories/local/local.categories.widget.dart';
import 'package:guess_the_text/features/categories/remote/remote.categories.widget.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/services/storage/shared.preferences.enum.dart';
import 'package:guess_the_text/services/storage/shared.preferences.services.dart';
import 'package:guess_the_text/theme/widgets/app.bar.title.widget.dart';
import 'package:guess_the_text/theme/widgets/responsive/navigation/navigation.choices.model.dart';
import 'package:guess_the_text/theme/widgets/responsive/navigation/responsive.navigation.rail.or.bar.widget.dart';

class CategoriesWidget extends StatelessWidget {
  final SharedPreferencesService preferences = serviceLocator.get();
  final _lastSelectionKey = SharedPreferenceKey.lastSelectedCategoriesListType.name;

  CategoriesWidget({Key? key}) : super(key: key);

  Widget childBuilder(int index) {
    preferences.setInt(_lastSelectionKey, index);
    return index == 0 ? const RemoteCategoriesWidget() : const LocalCategoriesWidget();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: localizations.categories),
        ),
        body: ResponsiveNavigationRailOrBar(
            currentIndex: preferences.getInt(_lastSelectionKey, defaultValue: 0),
            items: [
              NavigationChoices(text: localizations.categoryTypeCloud, icon: const Icon(Icons.cloud)),
              NavigationChoices(text: localizations.categoryTypeDevice, icon: const Icon(Icons.save_alt)),
            ],
            childBuilder: childBuilder));
  }
}
