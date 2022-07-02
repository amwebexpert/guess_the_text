import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '/service.locator.dart';
import '/utils/animation.utils.dart';

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
