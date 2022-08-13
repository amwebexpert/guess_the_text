import 'package:flutter/material.dart';
import 'package:guess_the_text/theme/theme.utils.dart';
import '/theme/widgets/snackbar/snackbar.model.dart';

class SnackbarWidget extends StatelessWidget {
  final String message;
  final SnackbarType type;

  const SnackbarWidget({Key? key, required this.message, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(snackbarIcons[type], color: Theme.of(context).colorScheme.secondary),
        SizedBox(width: spacing(2)),
        Expanded(child: Text(message)),
      ],
    );
  }
}
