import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guess_the_text/features/game/game.store.dart';
import 'package:guess_the_text/service.locator.dart';

class GameImageWidget extends StatefulWidget {
  const GameImageWidget({Key? key}) : super(key: key);

  @override
  State<GameImageWidget> createState() => _GameImageWidgetState();
}

class _GameImageWidgetState extends State<GameImageWidget> with SingleTickerProviderStateMixin {
  final GameStore gameStore = serviceLocator.get();
  late final AnimationController animController;
  late final Animation<double> scaleAnimation;

  String currentStateImg = '';

  @override
  void initState() {
    super.initState();

    animController = AnimationController(duration: const Duration(milliseconds: 2500), vsync: this);
    animController.addListener(() {
      setState(() {});
    });

    scaleAnimation =
        Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.decelerate)).animate(animController);

    setState(() {
      currentStateImg = gameStore.welcomeState;
    });

    // start animation once the initial state is loaded
    Future.delayed(const Duration(milliseconds: 100), () {
      animController.forward(from: 0).then((_) => {
            setState(() {
              currentStateImg = gameStore.currentStateImg;
            })
          });
    });
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      return scaleAnimation.isCompleted
          ? SvgPicture.asset(gameStore.currentStateImg)
          : ScaleTransition(scale: scaleAnimation, child: SvgPicture.asset(currentStateImg));
    });
  }
}
