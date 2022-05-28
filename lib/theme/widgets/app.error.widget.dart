import 'package:flutter/material.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';

class AppErrorWidget extends StatelessWidget {
  final FlutterErrorDetails details;

  const AppErrorWidget({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoggerService logger = serviceLocator.get();
    logger.error(details.exception.toString(), details.stack);

    return const Material(
      child: Center(
        child: Text(
          'Something went wrong!', // TODO Localize me
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
