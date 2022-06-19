import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guess_the_text/features/game/game.image.intro.widget.dart';
import 'package:guess_the_text/features/game/game.store.dart';
import 'package:guess_the_text/service.locator.dart';

class GameImageWidget extends StatefulWidget {
  const GameImageWidget({Key? key}) : super(key: key);

  @override
  State<GameImageWidget> createState() => _GameImageWidgetState();
}

class _GameImageWidgetState extends State<GameImageWidget> with SingleTickerProviderStateMixin {
  final GameStore gameStore = serviceLocator.get();

  bool isIntroAnimation = true;

  void onAnimationComplete() {
    if (mounted) {
      setState(() {
        isIntroAnimation = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      return Column(
        children: [
          Expanded(
            child: isIntroAnimation
                ? GameImageIntroWidget(onAnimationComplete: onAnimationComplete)
                : SvgPicture.asset(gameStore.currentStateImg, fit: BoxFit.fill),
          ),
        ],
      );
    });
  }
}
