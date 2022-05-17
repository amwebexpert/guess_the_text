import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:barcode/barcode.dart';
import 'package:guess_the_text/features/game/challenge/on_the_fly_challenge.model.dart';
import 'package:guess_the_text/features/settings/settings.store.dart';
import 'package:guess_the_text/theme/theme.utils.dart';

import 'qrcode.constants.dart';

class OnTheFlyChalengeQrWidget extends StatelessWidget {
  final OnTheFlyChallenge onTheFlyChallenge;
  const OnTheFlyChalengeQrWidget({Key? key, required this.onTheFlyChallenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsStore settingsStore = SettingsStore();
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    final String jsonChallenge = onTheFlyChallenge.toJson(localizations.qrCodeReadInstructions);
    final Barcode qrCode = Barcode.qrCode();
    final String qrCodeImage = qrCode.toSvg(jsonChallenge,
        width: qrCodeDefaultSquareSize,
        height: qrCodeDefaultSquareSize,
        color: settingsStore.isDarkTheme ? darkModeQrColor : lightModeQrColor);

    return SafeArea(
      child: Container(
        color: settingsStore.isDarkTheme ? Colors.black : Colors.white,
        child: Padding(
          padding: EdgeInsets.all(spacing(2)),
          child: Center(
            child: Column(
              children: [
                Text(
                  localizations.actionGenerateQR,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(height: spacing(1)),
                Text(
                  localizations.qrCodeInstructions,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Expanded(child: SvgPicture.string(qrCodeImage)),
                ElevatedButton(
                  child: Text(localizations.actionClose),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
