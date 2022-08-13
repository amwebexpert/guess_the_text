import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/features/categories/category.icons.map.dart';
import 'package:guess_the_text/features/categories/local/edit.category.widget.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/services/text.service/api.category.model.dart';
import 'package:guess_the_text/services/text.service/sql.db.service.dart';
import 'package:guess_the_text/theme/widgets/snackbar/snackbar.model.dart';
import 'package:guess_the_text/theme/widgets/snackbar/snackbar.utils.dart';
import 'package:guess_the_text/utils/language.utils.dart';

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
  final SqlDbService sqlDbService = serviceLocator.get();
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
      setState(() => categories.add(result));
    }
  }

  Future<void> _updateCategory(BuildContext context, ApiCategory category, int index) async {
    final ApiCategory? result =
        await showDialog(context: context, builder: (_) => EditCategory(category: category, isNew: false));

    if (result != null) {
      setState(() => categories[index] = result);
    }
  }

  Future<void> _deleteCategory(BuildContext context, ApiCategory category, int index) async {
    await sqlDbService.deleteCategory(category);
    setState(() => categories.remove(category));

    if (!mounted) {
      return;
    }

    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final action = SnackBarAction(
        label: 'UNDO',
        onPressed: () {
          sqlDbService.createCategory(category).then((restoredCategory) {
            setState(() => categories.insert(index, restoredCategory));
          });
        });
    showAppSnackbar(
        context: context,
        message: localizations.categoryDeletedMessage(category.name),
        type: SnackbarType.info,
        milliseconds: 4 * 1000,
        action: action);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                final id = category.id.toString();

                return Dismissible(
                    key: Key(id),
                    onDismissed: (direction) => _deleteCategory(context, category, index),
                    child: Card(
                      key: ValueKey(id),
                      child: ListTile(
                        leading: Icon(categoryIcons[category.iconName]),
                        title: Text(category.name),
                        subtitle: Text(getLanguageFullNameFromCode(context, category.langCode)),
                        onTap: () => _updateCategory(context, category, index),
                      ),
                    ));
              }),
        ),
      ));
}
