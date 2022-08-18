import 'package:flutter/material.dart';

import '/service.locator.dart';
import '/services/logger/logger.service.dart';

class AppErrorWidget extends StatelessWidget {
  final FlutterErrorDetails details;

  const AppErrorWidget({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    serviceLocator.get<LoggerService>().error(details.exception.toString(), stackTrace: details.stack);

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
