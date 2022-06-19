import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const welcomeImage = 'assets/images/hangman-happy.svg';

class GameImageIntroWidget extends StatefulWidget {
  final void Function() onAnimationComplete;

  const GameImageIntroWidget({Key? key, required this.onAnimationComplete}) : super(key: key);

  @override
  State<GameImageIntroWidget> createState() => _GameImageIntroWidgetState();
}

class _GameImageIntroWidgetState extends State<GameImageIntroWidget> with SingleTickerProviderStateMixin {
  late final AnimationController animController;
  late final Animation<double> scaleAnimation;
  late final Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    animController = AnimationController(duration: const Duration(milliseconds: 4000), vsync: this);
    animController.addListener(() {
      setState(() {});
    });

    scaleAnimation = TweenSequence(
      [
        TweenSequenceItem(tween: Tween<double>(begin: 0, end: 1.25), weight: 1.0),
        TweenSequenceItem(tween: Tween<double>(begin: 1.25, end: 1.0), weight: 1.0),
      ],
    ).animate(CurvedAnimation(parent: animController, curve: const Interval(0, .75)));

    fadeAnimation = Tween<double>(begin: 1, end: 0)
        .chain(CurveTween(curve: Curves.ease))
        .animate(CurvedAnimation(parent: animController, curve: const Interval(.75, 1)));

    Future.delayed(const Duration(milliseconds: 300), () {
      animController.forward(from: 0).then((value) => widget.onAnimationComplete());
    });
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: fadeAnimation,
        child: ScaleTransition(
            scale: scaleAnimation,
            child: SvgPicture.asset(
              welcomeImage,
              fit: BoxFit.fill,
            )));
  }
}
