import 'package:flutter/material.dart';
import 'package:guess_the_text/services/text.service/api.category.model.dart';

import '/theme/theme.utils.dart';
import '/theme/widgets/full.screen.bg.image.widget.dart';
import 'category.widget.dart';

class CategoriesListWidget extends StatelessWidget {
  static const String backgroundImage = 'assets/images/backgrounds/background-pexels-pixabay-461940.jpg';

  const CategoriesListWidget({Key? key, required this.categories}) : super(key: key);

  final List<ApiCategory> categories;

  @override
  Widget build(BuildContext context) => FullScreenAssetBackground(
        assetImagePath: backgroundImage,
        child: Padding(
          padding: EdgeInsets.all(spacing(2)),
          child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) => CategoryWidget(category: categories[index])),
        ),
      );
}
