import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/services/text.service/api.category.model.dart';

import '/theme/theme.utils.dart';
import '/theme/widgets/app.bar.title.widget.dart';
import '/theme/widgets/full.screen.bg.image.widget.dart';
import 'category.widget.dart';

class CategoriesListWidget extends StatelessWidget {
  static const String backgroundImage = 'assets/images/backgrounds/background-pexels-pixabay-461940.jpg';

  const CategoriesListWidget({Key? key, required this.categories}) : super(key: key);

  final List<ApiCategory> categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: AppLocalizations.of(context)!.categories),
      ),
      body: FullScreenAssetBackground(
        assetImagePath: backgroundImage,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: spacing(1)),
          child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) => CategoryWidget(category: categories[index])),
        ),
      ),
    );
  }
}
