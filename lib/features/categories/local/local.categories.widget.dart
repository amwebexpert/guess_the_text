import 'package:flutter/material.dart';

import '../../../service.locator.dart';
import '../../../services/text.service/api.category.model.dart';
import '../../../services/text.service/sql.db.service.dart';
import '../loading.error.widget.dart';
import '../loading.widget.dart';
import 'categories.list.widget.dart';

class LocalCategoriesWidget extends StatefulWidget {
  const LocalCategoriesWidget({Key? key}) : super(key: key);

  @override
  State<LocalCategoriesWidget> createState() => _LocalCategoriesWidgetState();
}

class _LocalCategoriesWidgetState extends State<LocalCategoriesWidget> {
  final SqlDbService sqlDbService = serviceLocator.get();

  late Future<List<ApiCategory>> _categoriesFuture;

  @override
  void initState() {
    super.initState();
    _categoriesFuture = sqlDbService.getCategories();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<List<ApiCategory>>(
      future: _categoriesFuture,
      builder: ((context, snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? snapshot.hasData
                ? CategoriesListWidget(originalCategories: snapshot.data!)
                : const LoadingErrorWidget()
            : const ElementsLoadingWidget();
      }));
}
