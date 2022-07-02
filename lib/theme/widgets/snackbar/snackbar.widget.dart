import 'package:flutter/material.dart';
import '/theme/theme.utils.dart';
import '/theme/widgets/snackbar/snackbar.model.dart';

class SnackbarWidget extends StatelessWidget {
  final String message;
  final SnackbarType type;

  const SnackbarWidget({Key? key, required this.message, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(snackbarIcons[type], color: Theme.of(context).colorScheme.secondary),
        Padding(
          padding: EdgeInsets.only(left: spacing(1)),
          child: Text(message),
        ),
      ],
    );
  }
}
