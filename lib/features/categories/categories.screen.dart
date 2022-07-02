import 'package:flutter/material.dart';
import 'package:guess_the_text/features/categories/api.category.model.dart';
import 'package:guess_the_text/features/categories/categories.list.widget.dart';
import 'package:guess_the_text/features/categories/loading.error.widget.dart';
import 'package:guess_the_text/features/categories/loading.widget.dart';
import 'package:guess_the_text/features/game/api.texts.service.dart';
import 'package:guess_the_text/service.locator.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  final TextsService _textsService = serviceLocator.get();

  late Future<List<ApiCategory>> _categoriesFuture;

  @override
  void initState() {
    super.initState();
    _categoriesFuture = _textsService.getCategories();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<List<ApiCategory>>(
      future: _categoriesFuture,
      builder: ((context, snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? snapshot.hasData
                ? CategoriesListWidget(categories: snapshot.data!)
                : const LoadingErrorWidget()
            : const CategoriesLoadingWidget();
      }));
}
