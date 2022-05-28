import 'package:flutter/material.dart';
import 'package:guess_the_text/theme/theme.utils.dart';

class SnackbarInfoWidget extends StatelessWidget {
  final String message;

  const SnackbarInfoWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Icon(Icons.info, color: Colors.orange),
        Padding(
          padding: EdgeInsets.only(left: spacing(1)),
          child: Text(message),
        ),
      ],
    );
  }
}
