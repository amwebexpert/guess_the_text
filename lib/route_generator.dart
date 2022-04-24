import 'package:flutter/material.dart';
import 'package:guess_the_text/screens/about/about_widget.dart';
import 'package:guess_the_text/screens/categories/categories_widget.dart';
import 'package:guess_the_text/screens/game/game_widget.dart';
import 'package:guess_the_text/screens/settings/settings_widget.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';

Route? onGenerateRoute(RouteSettings settings) {
  final LoggerService logger = LoggerService();

  logger.info('Navigation to ${settings.name}');
  if (settings.arguments != null) {
    logger.info('Navigation arguments ${settings.arguments}');
  }

  switch (settings.name) {
    case '/':
    case '/game':
      return MaterialPageRoute(builder: (context) => const GameWidget());

    case '/categories':
      return MaterialPageRoute(builder: (context) => const CategoriesWidget());

    case '/settings':
      return MaterialPageRoute(builder: (context) => const SettingsWidget());

    case '/about':
      return MaterialPageRoute(builder: (context) => const AboutWidget());

    default:
      logger.error('Invalid navigation', settings.name);
      return MaterialPageRoute(builder: (context) => const GameWidget());
  }
}
