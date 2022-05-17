import 'package:flutter/material.dart';
import 'package:guess_the_text/model/on_the_fly_challenge.model.dart';
import 'package:guess_the_text/screens/about/about.screen.dart';
import 'package:guess_the_text/screens/categories/categories.screen.dart';
import 'package:guess_the_text/screens/game/challenge/on_the_fly_chalenge_qr_widget.dart';
import 'package:guess_the_text/screens/game/challenge/on_the_fly_chalenge_widget.dart';
import 'package:guess_the_text/screens/game/game.screen.dart';
import 'package:guess_the_text/screens/settings/settings.screen.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';

Route? onGenerateRoute(RouteSettings settings) {
  final LoggerService logger = LoggerService();

  logger.info('Navigation to ${settings.name}');
  final uriLink = Uri.parse(settings.name ?? '/');

  switch (uriLink.path) {
    case '/':
      return MaterialPageRoute(builder: (_) => const GameWidget());

    case '/game':
      if (!uriLink.hasQuery) {
        return MaterialPageRoute(builder: (_) => const GameWidget());
      }
      return MaterialPageRoute(builder: (_) => OnTheFlyChalengeWidget(queryParameters: uriLink.queryParameters));

    case '/categories':
      return MaterialPageRoute(builder: (_) => const CategoriesWidget());

    case '/onTheFlyChallenge':
      return MaterialPageRoute(
          builder: (_) => OnTheFlyChalengeQrWidget(
                onTheFlyChallenge: settings.arguments as OnTheFlyChallenge,
              ));

    case '/settings':
      return MaterialPageRoute(builder: (_) => const SettingsWidget());

    case '/about':
      return MaterialPageRoute(builder: (_) => const AboutWidget());

    default:
      logger.error('Invalid navigation', settings.name);
      return MaterialPageRoute(builder: (_) => const GameWidget());
  }
}
