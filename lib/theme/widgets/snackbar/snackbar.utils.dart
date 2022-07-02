import 'package:flutter/material.dart';
import '/theme/theme.utils.dart';
import '/theme/widgets/snackbar/snackbar.model.dart';
import '/theme/widgets/snackbar/snackbar.widget.dart';

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
