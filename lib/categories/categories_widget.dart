import 'package:flutter/material.dart';
import 'package:guess_the_text/services/api_category.dart';
import 'package:guess_the_text/services/hangman_service.dart';

class CategoriesWidget extends StatelessWidget {
  final HangmanService service = HangmanService.singleton;

  void loadCategory(BuildContext context, index) async {
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
    const String title = 'About this application...';
    List<ApiCategory> categories = service.categories;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
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
                  title: Text(categories[index].name),
                  leading: Icon(Icons.refresh),
                ),
              ),
            );
          }),
    );
  }
}
