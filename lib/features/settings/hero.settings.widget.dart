import 'package:flutter/material.dart';
import 'package:guess_the_text/theme/theme.utils.dart';
import 'package:guess_the_text/utils/icon.utils.dart';

const double size = 60.0;

class HeroSettingsWidget extends StatelessWidget {
  HeroSettingsWidget({Key? key}) : super(key: key);

  final TweenSequence<double> scaleSequence = TweenSequence([
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 5.0), weight: 1),
    TweenSequenceItem(tween: Tween(begin: 5.0, end: 1.0), weight: 1),
  ]);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'app-menu-item-preferences',
      child: buildIcon(context),
      placeholderBuilder: (context, size, child) => buildIcon(context, colorAlpha: 0.70),
      flightShuttleBuilder: (
        flightContext,
        animation,
        flightDirection,
        fromHeroContext,
        toHeroContext,
      ) {
        return ScaleTransition(
          scale: scaleSequence.animate(animation),
          child: buildIcon(context, colorAlpha: 0.8),
        );
      },
    );
  }
}

Icon buildIcon(BuildContext context, {double colorAlpha = 1}) {
  final baseColor = Theme.of(context).colorScheme.primary;

  return Icon(
    iconsMap['preferences']!,
    size: size,
    color: baseColor.withAlpha(alpha(colorAlpha)),
  );
}
