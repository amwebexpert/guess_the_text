import 'package:flutter/material.dart';
import 'package:guess_the_text/features/categories/local/edit.category.widget.dart';
import 'package:guess_the_text/services/text.service/api.category.model.dart';

import '/theme/theme.utils.dart';
import '/theme/widgets/full.screen.bg.image.widget.dart';

class CategoriesListWidget extends StatefulWidget {
  static const String backgroundImage = 'assets/images/backgrounds/background-pexels-pixabay-461940.jpg';

  const CategoriesListWidget({Key? key, required this.originalCategories}) : super(key: key);

  final List<ApiCategory> originalCategories;

  @override
  State<CategoriesListWidget> createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  late List<ApiCategory> categories;

  @override
  void initState() {
    super.initState();
    categories = widget.originalCategories;
  }

  Future<void> _createCategory(BuildContext context) async {
    final ApiCategory? result =
        await showDialog(context: context, builder: (_) => const EditCategory(category: ApiCategory(), isNew: true));

    if (result != null) {
      categories.add(result);
      setState(() {});
    }
  }

  Future<void> _updateCategory(BuildContext context, ApiCategory category, int index) async {
    final ApiCategory? result =
        await showDialog(context: context, builder: (_) => EditCategory(category: category, isNew: false));

    if (result != null) {
      categories[index] = result;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            FloatingActionButton(child: const Icon(Icons.add), onPressed: () => _createCategory(context)),
        body: FullScreenAssetBackground(
          assetImagePath: CategoriesListWidget.backgroundImage,
          child: Padding(
            padding: EdgeInsets.all(spacing(2)),
            child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Dismissible(
                      key: Key(category.id.toString()),
                      onDismissed: (direction) {}, // TODO Deleted the category
                      child: Card(
                        key: ValueKey(category.id.toString()),
                        child: ListTile(
                          title: Text(category.name),
                          onTap: () => _updateCategory(context, category, index),
                        ),
                      ));
                }),
          ),
        ));
  }
}
