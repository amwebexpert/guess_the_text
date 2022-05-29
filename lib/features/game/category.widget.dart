import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guess_the_text/features/game/game.store.dart';
import 'package:guess_the_text/service.locator.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameStore gameStore = serviceLocator.get();

    return Observer(builder: (BuildContext context) {
      return Text(
        gameStore.currentCategory.name,
        style: Theme.of(context).textTheme.bodyText2,
      );
    });
  }
}
