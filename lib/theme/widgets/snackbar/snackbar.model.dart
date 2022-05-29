import 'package:flutter/material.dart';

enum SnackbarType { info, success, warning, error }

const Map<SnackbarType, IconData> snackbarIcons = {
  SnackbarType.info: Icons.info_outline,
  SnackbarType.success: Icons.check_circle_outline,
  SnackbarType.warning: Icons.warning_outlined,
  SnackbarType.error: Icons.error_outline,
};
