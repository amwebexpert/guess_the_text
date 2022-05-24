import 'package:flutter/material.dart';

class LoadingErrorWidget extends StatelessWidget {
  const LoadingErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'error_loading_categories', // TODO Localize me
        style: Theme.of(context).textTheme.bodyText1, // TODO error style?
      ),
    );
  }
}
