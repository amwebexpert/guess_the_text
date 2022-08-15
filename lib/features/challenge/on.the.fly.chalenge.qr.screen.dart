import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../service.locator.dart';
import '../../services/qr/qr.code.service.dart';
import '../../theme/theme.utils.dart';
import 'chalenge.qr.landscape.layout.dart';
import 'chalenge.qr.portrait.layout.dart';
import 'on.the.fly.challenge.model.dart';

class OnTheFlyChalengeQrScreen extends StatelessWidget {
  final QrCodeService _qrCodeService = serviceLocator.get();
  final OnTheFlyChallenge onTheFlyChallenge;

  OnTheFlyChalengeQrScreen({Key? key, required this.onTheFlyChallenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final String jsonChallenge = onTheFlyChallenge.toJson(localizations.qrCodeReadInstructions);
    final color = isDarkTheme ? Colors.black : Colors.white;
    final qrCodeColor = isDarkTheme ? Colors.white.value : Colors.black.value;
    final String qrCodeImage = _qrCodeService.generateSvg(text: jsonChallenge, color: qrCodeColor);

    return SafeArea(
      child: Container(
        color: color,
        child: Padding(
          padding: EdgeInsets.all(spacing(2)),
          child: Center(
            child: OrientationBuilder(builder: (context, orientation) {
              return orientation == Orientation.portrait
                  ? OnTheFlyChalengeQrPortrait(qrCodeImage: qrCodeImage)
                  : OnTheFlyChalengeQrLandscape(qrCodeImage: qrCodeImage);
            }),
          ),
        ),
      ),
    );
  }
}
