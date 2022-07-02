import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '/service.locator.dart';
import '/theme/widgets/animations/slide.intro.widget.dart';
import '/utils/animation.utils.dart';

class CardHeaderAnimation extends StatelessWidget {
  const CardHeaderAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnimationUtils animationUtils = serviceLocator.get();

    return SizedBox(
        width: 200,
        child: Center(
          child: SlideIntroWidget(
              duration: const Duration(seconds: 6), child: Lottie.asset(animationUtils.getAnimationPath())),
        ));
  }
}
