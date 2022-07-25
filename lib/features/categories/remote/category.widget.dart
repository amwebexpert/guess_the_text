import 'package:flutter/material.dart';
import 'package:guess_the_text/services/text.service/api.category.model.dart';

import '/features/categories/category.icons.map.dart';
import '/features/game/game.store.dart';
import '/service.locator.dart';
import '/theme/theme.utils.dart';

class CategoryWidget extends StatelessWidget {
  final GameStore _gameStore = serviceLocator.get();

  final ApiCategory category;

  CategoryWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Padding(
        padding: EdgeInsets.all(spacing(0.25)),
        child: Card(
          color: Theme.of(context).colorScheme.primary,
          child: ListTile(
            onTap: () {
              _gameStore.selectCategory(category);
              Navigator.pop(context);
            },
            leading: Icon(categoryIcons[category.iconName]),
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
