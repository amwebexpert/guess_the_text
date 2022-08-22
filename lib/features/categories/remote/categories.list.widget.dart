import 'package:flutter/material.dart';

import '/theme/theme.utils.dart';
import '/theme/widgets/full.screen.bg.image.widget.dart';
import '../../../service.locator.dart';
import '../../../services/assets/asset.locator.service.dart';
import '../../../services/text.service/api.category.model.dart';
import 'category.widget.dart';

class CategoriesListWidget extends StatelessWidget {
  final String backgroundImage = serviceLocator.get<AssetLocatorService>().darkBackgroundImagePath();
  CategoriesListWidget({Key? key, required this.categories}) : super(key: key);

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
