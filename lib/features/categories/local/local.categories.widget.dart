import 'package:flutter/material.dart';
import 'package:guess_the_text/features/categories/loading.error.widget.dart';
import 'package:guess_the_text/features/categories/loading.widget.dart';
import 'package:guess_the_text/features/categories/local/categories.list.widget.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/services/text.service/api.category.model.dart';
import 'package:guess_the_text/services/text.service/sql.db.service.dart';

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
            : const CategoriesLoadingWidget();
      }));
}
