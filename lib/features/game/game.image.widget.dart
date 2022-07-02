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
  final GameStore _gameStore = serviceLocator.get();

  bool _isIntroAnimation = true;

  void onAnimationComplete() {
    if (mounted) {
      setState(() {
        _isIntroAnimation = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      return Column(
        children: [
          Expanded(
            child: _isIntroAnimation
                ? GameImageIntroWidget(onAnimationComplete: onAnimationComplete)
                : SvgPicture.asset(_gameStore.currentStateImg, fit: BoxFit.fill),
          ),
        ],
      );
    });
  }
}
