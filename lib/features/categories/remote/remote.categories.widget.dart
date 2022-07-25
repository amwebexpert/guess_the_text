import 'package:flutter/material.dart';
import 'package:guess_the_text/features/categories/remote/categories.list.widget.dart';
import 'package:guess_the_text/services/text.service/api.category.model.dart';
import 'package:guess_the_text/services/text.service/api.texts.service.dart';

import '/features/categories/loading.error.widget.dart';
import '/features/categories/loading.widget.dart';
import '/service.locator.dart';

class RemoteCategoriesWidget extends StatefulWidget {
  const RemoteCategoriesWidget({Key? key}) : super(key: key);

  @override
  State<RemoteCategoriesWidget> createState() => _RemoteCategoriesWidgetState();
}

class _RemoteCategoriesWidgetState extends State<RemoteCategoriesWidget> {
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
