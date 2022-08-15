import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '/service.locator.dart';
import '/utils/animation.utils.dart';

class ElementsLoadingWidget extends StatelessWidget {
  const ElementsLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnimationUtils animationUtils = serviceLocator.get();

    return Center(
      key: const Key('elements_loading'),
      child: Lottie.asset(animationUtils.getAnimationPath()),
    );
  }
}
