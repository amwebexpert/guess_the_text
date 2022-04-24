import 'package:flutter/material.dart';

class OnTheFlyChalengeWidget extends StatelessWidget {
  final Map<String, String> queryParameters;

  const OnTheFlyChalengeWidget({Key? key, required this.queryParameters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        queryParameters.toString(),
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
