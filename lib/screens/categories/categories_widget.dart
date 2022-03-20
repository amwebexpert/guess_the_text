import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/services/hangman/hangman_service.dart';
import 'package:guess_the_text/services/hangman/model/api_category.dart';
import 'package:guess_the_text/theme/app_bar/app_bar_title.dart';
import 'package:guess_the_text/theme/theme_utils.dart';

import 'package:guess_the_text/utils/icon_utils.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  void loadCategory(BuildContext context, index) async {
    final HangmanService service = HangmanService();
    List<ApiCategory> categories = service.categories;
    ApiCategory category = categories[index];

    service.selectedCategoryUuid = category.uuid;
    await service.loadData();

    Navigator.pop(context, {
      'name': category.name,
      'uuid': category.uuid,
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ApiCategory> categories = HangmanService().categories;
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.categories),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: spacing(1)),
        child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(spacing(0.25)),
                child: Card(
                  child: ListTile(
                    onTap: () => loadCategory(context, index),
                    leading: Icon(iconsMap[categories[index].name]), // add an iconName attribute to model
                    title: Text(
                      categories[index].name,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
