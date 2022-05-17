import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/services/hangman/model/api_category.model.dart';
import 'package:guess_the_text/services/hangman/texts.service.dart';
import 'package:guess_the_text/store/game/game.store.dart';
import 'package:guess_the_text/theme/theme.utils.dart';
import 'package:guess_the_text/utils/animation.utils.dart';

import 'package:guess_the_text/utils/icon.utils.dart';
import 'package:guess_the_text/utils/randomizer.utils.dart';
import 'package:guess_the_text/widgets/app_bar_title.widget.dart';
import 'package:lottie/lottie.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  final TextsService textsService = TextsService();
  final GameStore gameStore = GameStore();
  static const String backgroundImage = 'assets/images/backgrounds/background-pexels-pixabay-461940.jpg';

  bool isAppLoading = true;
  List<ApiCategory> categories = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    categories = await textsService.getCategories();
    setState(() {
      isAppLoading = false;
    });
  }

  void selectCategory(ApiCategory category, BuildContext context) async {
    await gameStore.selectCategory(category);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    if (isAppLoading) {
      return Center(
        child: Lottie.asset(AnimationUtils(RandomizerUtils()).getAnimationPath()),
      );
    }

    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.categories),
      ),
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(backgroundImage), fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: spacing(1)),
          child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final ApiCategory category = categories[index];

                return Padding(
                  padding: EdgeInsets.all(spacing(0.25)),
                  child: Card(
                    color: Theme.of(context).colorScheme.primary,
                    child: ListTile(
                      onTap: () => selectCategory(category, context),
                      leading: Icon(iconsMap[category.name]), // add an iconName attribute to model
                      title: Text(
                        category.name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
