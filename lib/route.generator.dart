import 'package:flutter/material.dart';
import 'package:guess_the_text/features/about/about.screen.dart';
import 'package:guess_the_text/features/categories/categories.screen.dart';
import 'package:guess_the_text/features/game/challenge/on.the.fly.chalenge.qr.screen.dart';
import 'package:guess_the_text/features/game/challenge/on.the.fly.challenge.model.dart';
import 'package:guess_the_text/features/game/game.screen.dart';
import 'package:guess_the_text/features/settings/settings.screen.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';

Route? onGenerateRoute(RouteSettings settings) {
  final LoggerService logger = serviceLocator.get();

  Uri uriLink = extractUri(settings);

  switch (uriLink.path) {
    case '/':
      return MaterialPageRoute(builder: (_) => const GameWidget());

    case '/game':
      return MaterialPageRoute(builder: (_) => const GameWidget());

    case '/categories':
      return MaterialPageRoute(builder: (_) => const CategoriesWidget());

    case '/onTheFlyChallenge':
      return MaterialPageRoute(
          builder: (_) => OnTheFlyChalengeQrScreen(
                onTheFlyChallenge: settings.arguments as OnTheFlyChallenge,
              ));

    case '/settings':
      return PageRouteBuilder(
          pageBuilder: ((context, animation, secondaryAnimation) => const SettingsWidget()),
          transitionDuration: const Duration(seconds: 2));

    case '/about':
      return MaterialPageRoute(builder: (_) => const AboutWidget());

    default:
      logger.error('Invalid navigation', settings.name);
      return MaterialPageRoute(builder: (_) => const GameWidget());
  }
}

Uri extractUri(RouteSettings settings) {
  final LoggerService logger = serviceLocator.get();

  logger.info('Navigation to ${settings.name}');
  final uriLink = Uri.parse(settings.name ?? '/');

  if (uriLink.hasQuery) {
    logger.info('Navigation parameters: ${uriLink.queryParameters}');
  }

  return uriLink;
}
