import 'package:flutter/material.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/utils/animation.utils.dart';
import 'package:lottie/lottie.dart';

class CategoriesLoadingWidget extends StatelessWidget {
  const CategoriesLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnimationUtils animationUtils = serviceLocator.get();

    return Center(
      key: const Key('categories_loading'),
      child: Lottie.asset(animationUtils.getAnimationPath()),
    );
  }
}
