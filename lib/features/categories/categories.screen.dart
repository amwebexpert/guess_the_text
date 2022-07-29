import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/features/categories/categories.landscape.layout.widget.dart';
import 'package:guess_the_text/features/categories/categories.portrait.layout.widget.dart';
import 'package:guess_the_text/theme/widgets/app.bar.title.widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: AppLocalizations.of(context)!.categories),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? const CategoriesPortraitWidget()
              : const CategoriesLandscapeWidget();
        },
      ));
}
