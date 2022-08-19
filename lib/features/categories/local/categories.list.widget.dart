import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../service.locator.dart';
import '../../../services/text.service/api.category.model.dart';
import '../../../services/text.service/sql.db.service.dart';
import '../../../theme/app.theme.dart';
import '../../../theme/theme.utils.dart';
import '../../../theme/widgets/dialogs/confirm.dialog.widget.dart';
import '../../../theme/widgets/full.screen.bg.image.widget.dart';
import '../../../theme/widgets/snackbar/snackbar.model.dart';
import '../../../theme/widgets/snackbar/snackbar.utils.dart';
import '../../../utils/language.utils.dart';
import '../category.icons.map.dart';
import 'edit.category.widget.dart';
import 'texts/local.texts.widget.dart';

class CategoriesListWidget extends StatefulWidget {
  static const String backgroundImage = 'assets/images/backgrounds/background-pexels-pixabay-461940.jpg';

  const CategoriesListWidget({Key? key, required this.originalCategories}) : super(key: key);

  final List<ApiCategory> originalCategories;

  @override
  State<CategoriesListWidget> createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  final SqlDbService? sqlDbService = serviceLocator.isRegistered<SqlDbService>() ? serviceLocator.get() : null;
  late bool isFeatureSupported = sqlDbService?.isPlateformSupported ?? false;
  late List<ApiCategory> categories;

  @override
  void initState() {
    super.initState();
    categories = widget.originalCategories;
  }

  Future<void> _createCategory() async {
    final ApiCategory? result = await showDialog(context: context, builder: (_) => const EditCategory(category: ApiCategory(), isNew: true));

    if (result != null) {
      setState(() => categories.add(result));
    }
  }

  Future<void> _updateCategory(ApiCategory category, int index) async {
    final ApiCategory? result = await showDialog(context: context, builder: (_) => EditCategory(category: category, isNew: false));

    if (result != null) {
      setState(() => categories[index] = result);
    }
  }

  Future<void> _deleteCategory(ApiCategory category, int index) async {
    showConfirmDialog(
        context: context,
        title: 'Remove category', // TODO Translate me
        body: 'Delete the entire category including all it\'s text entries?', // TODO Translate me
        onCancel: () => setState(() {}),
        onConfirm: () => _doDeleteCategory(category));
  }

  Future<void> _doDeleteCategory(ApiCategory category) async {
    await sqlDbService?.deleteCategory(category);

    if (!mounted) {
      return;
    }

    showAppSnackbar(context: context, message: AppLocalizations.of(context)!.categoryDeletedMessage(category.name), type: SnackbarType.info);
    setState(() => categories.remove(category));
  }

  void _editCategoryElements(ApiCategory category) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LocalTextsWidget(category: category)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO early return feature-not-supported whenever isFeatureSupported is false
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: isFeatureSupported ? _createCategory : null, child: const Icon(Icons.add)),
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
                      key: UniqueKey(),
                      onDismissed: (direction) => _deleteCategory(category, index),
                      child: Card(
                        key: ValueKey(id),
                        child: ListTile(
                          leading: Icon(categoryIcons[category.iconName]),
                          title: Text(category.name, style: Theme.of(context).textTheme.bodyText1),
                          trailing: ElevatedButton(style: listTileTralingButtonStyle, child: const Icon(Icons.edit), onPressed: () => _updateCategory(category, index)),
                          subtitle: Text(getLanguageFullNameFromCode(context, category.langCode)),
                          onTap: () => _editCategoryElements(category),
                        ),
                      ));
                }),
          ),
        ));
  }
}