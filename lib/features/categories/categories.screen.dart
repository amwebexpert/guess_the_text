import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/features/categories/local/local.categories.widget.dart';
import 'package:guess_the_text/features/categories/remote/remote.categories.widget.dart';
import 'package:guess_the_text/theme/widgets/app.bar.title.widget.dart';
import 'package:guess_the_text/theme/widgets/responsive/navigation/navigation.choices.model.dart';
import 'package:guess_the_text/theme/widgets/responsive/navigation/responsive.navigation.rail.or.bar.widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  Widget childBuilder(int index) => index == 0 ? const RemoteCategoriesWidget() : const LocalCategoriesWidget();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    final List<NavigationChoices> items = [
      NavigationChoices(icon: const Icon(Icons.cloud), text: localizations.categoryTypeCloud),
      NavigationChoices(icon: const Icon(Icons.save_alt), text: localizations.categoryTypeDevice),
    ];

    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: localizations.categories),
        ),
        body: ResponsiveNavigationRailOrBar(currentIndex: 0, items: items, childBuilder: childBuilder));
  }
}
