import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:guess_the_text/services/api_category.dart';
import 'package:guess_the_text/services/hangman_service.dart';
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
        title: Text(
          localizations.categories,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'IndieFlower',
          ),
        ),
        backgroundColor: Colors.orange[700],
      ),
      body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                child: ListTile(
                  onTap: () => loadCategory(context, index),
                  leading: Icon(iconsMap[categories[index].name]), // add an iconName attribute to model
                  title: Text(
                    categories[index].name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'IndieFlower',
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
