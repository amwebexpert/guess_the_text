import 'package:flutter/material.dart';
import 'package:guess_the_text/theme/theme.utils.dart';
import 'package:guess_the_text/theme/widgets/snackbar/snackbar.widget.dart';
import 'package:guess_the_text/theme/widgets/snackbar/snackbar.model.dart';

void showAppSnackbar({required BuildContext context, required String message, required SnackbarType type}) {
  const duration = Duration(milliseconds: 2000);
  final shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(spacing(1)),
  );

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: SnackbarWidget(message: message, type: type),
    shape: shape,
    duration: duration,
  ));
}
