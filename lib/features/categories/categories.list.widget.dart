import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/features/categories/api_category.model.dart';
import 'package:guess_the_text/features/game/game.store.dart';
import 'package:guess_the_text/theme/theme.utils.dart';

import 'package:guess_the_text/utils/icon.utils.dart';
import 'package:guess_the_text/widgets/app_bar_title.widget.dart';

class CategoriesListWidget extends StatelessWidget {
  static const String backgroundImage = 'assets/images/backgrounds/background-pexels-pixabay-461940.jpg';

  final GameStore gameStore = serviceLocator.get();

  CategoriesListWidget({Key? key, required this.categories}) : super(key: key);

  final List<ApiCategory> categories;

  void selectCategory(ApiCategory category, BuildContext context) async {
    await gameStore.selectCategory(category);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: AppLocalizations.of(context)!.categories),
      ),
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(backgroundImage), fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: spacing(1)),
          child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final ApiCategory category = categories[index];

                return Opacity(
                  opacity: 0.9,
                  child: Padding(
                    padding: EdgeInsets.all(spacing(0.25)),
                    child: Card(
                      color: Theme.of(context).colorScheme.primary,
                      child: ListTile(
                        onTap: () => selectCategory(category, context),
                        leading: Icon(iconsMap[category.name]), // add an iconName attribute to model
                        title: Text(
                          category.name,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
