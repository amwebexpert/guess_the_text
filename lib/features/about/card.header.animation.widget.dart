import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '/service.locator.dart';
import '/services/logger/logger.service.dart';
import '/theme/widgets/animations/slide.intro.widget.dart';
import '/utils/animation.utils.dart';

class CardHeaderAnimation extends StatefulWidget {
  const CardHeaderAnimation({Key? key}) : super(key: key);

  @override
  State<CardHeaderAnimation> createState() => _CardHeaderAnimationState();
}

class _CardHeaderAnimationState extends State<CardHeaderAnimation> {
  final LoggerService logger = serviceLocator.get();
  final AnimationUtils animationUtils = serviceLocator.get();
  String _assetAnimation = '';

  @override
  void initState() {
    super.initState();
    updateAnimation();
  }

  void updateAnimation() {
    final newAnimation = animationUtils.getAnimationPath();
    logger.info('asset animation: [$newAnimation]');
    setState(() {
      _assetAnimation = newAnimation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: updateAnimation,
      child: SizedBox(
          width: 200,
          child: Center(
            child: SlideIntroWidget(duration: const Duration(seconds: 6), child: Lottie.asset(_assetAnimation)),
          )),
    );
  }
}
