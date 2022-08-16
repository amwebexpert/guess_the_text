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
  late Future<List<ApiCategory>> _categoriesFuture;

  @override
  void initState() {
    super.initState();

    if (serviceLocator.isRegistered<SqlDbService>()) {
      final SqlDbService sqlDbService = serviceLocator.get();
      _categoriesFuture = sqlDbService.isPlateformSupported ? sqlDbService.getCategories() : Future.value([]);
    } else {
      _categoriesFuture = Future.value([]);
    }
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
