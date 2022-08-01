import 'package:flutter/material.dart';
import 'package:guess_the_text/features/categories/local/edit.category.widget.dart';
import 'package:guess_the_text/services/text.service/api.category.model.dart';

import '/theme/theme.utils.dart';
import '/theme/widgets/full.screen.bg.image.widget.dart';

class CategoriesListWidget extends StatelessWidget {
  static const String backgroundImage = 'assets/images/backgrounds/background-pexels-pixabay-461940.jpg';

  const CategoriesListWidget({Key? key, required this.categories}) : super(key: key);

  final List<ApiCategory> categories;

  void _createCategory(BuildContext context) {
    const category = ApiCategory();
    Navigator.push(context, MaterialPageRoute(builder: (_) => const EditCategory(category: category, isNew: true)));
  }

  void _updateCategory(BuildContext context, ApiCategory category) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => EditCategory(category: category, isNew: false)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            FloatingActionButton(child: const Icon(Icons.add), onPressed: () => _createCategory(context)),
        body: FullScreenAssetBackground(
          assetImagePath: backgroundImage,
          child: Padding(
            padding: EdgeInsets.all(spacing(2)),
            child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Dismissible(
                      key: Key(category.id.toString()),
                      onDismissed: (direction) {},
                      child: Card(
                        key: ValueKey(category.id.toString()),
                        child: ListTile(
                          title: Text(category.name),
                          onTap: () => _updateCategory(context, category),
                        ),
                      ));
                }),
          ),
        ));
  }
}
