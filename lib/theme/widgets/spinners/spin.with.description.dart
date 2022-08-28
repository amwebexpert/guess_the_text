import 'package:flutter/material.dart';

import '../../theme.utils.dart';

void showSpinnerWithDescription({required String description, required BuildContext context}) {
  final verticalSpacing = spacing(2);

  showDialog(
      barrierDismissible: false, // user CANNOT close this dialog by pressing outsite
      context: context,
      builder: (_) {
        return Dialog(
          child: Padding(
            padding: EdgeInsets.all(verticalSpacing),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                SizedBox(height: verticalSpacing),
                Text(
                  description,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        );
      });
}
