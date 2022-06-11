import 'package:flutter/material.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/theme/widgets/animations/horizontal.slide.intro.widget.dart';
import 'package:guess_the_text/utils/animation.utils.dart';
import 'package:lottie/lottie.dart';

class CardHeaderAnimation extends StatelessWidget {
  const CardHeaderAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnimationUtils animationUtils = serviceLocator.get();

    return SizedBox(
        width: 200,
        child: Center(
          child: HorizontalSlideIntroWidget(child: Lottie.asset(animationUtils.getAnimationPath())),
        ));
  }
}
