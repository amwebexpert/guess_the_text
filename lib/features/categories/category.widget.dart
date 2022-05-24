import 'package:flutter/material.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/features/categories/api_category.model.dart';
import 'package:guess_the_text/features/game/game.store.dart';
import 'package:guess_the_text/theme/theme.utils.dart';

import 'package:guess_the_text/utils/icon.utils.dart';

class CategoryWidget extends StatelessWidget {
  final GameStore gameStore = serviceLocator.get();

  final ApiCategory category;

  CategoryWidget({Key? key, required this.category}) : super(key: key);

  void selectCategory(ApiCategory category, BuildContext context) async {
    await gameStore.selectCategory(category);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
