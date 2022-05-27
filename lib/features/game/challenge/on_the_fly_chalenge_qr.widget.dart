import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guess_the_text/features/game/challenge/on_the_fly_challenge.model.dart';
import 'package:guess_the_text/features/settings/settings.store.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/services/qr/qr.code.service.dart';
import 'package:guess_the_text/theme/theme.utils.dart';

class OnTheFlyChalengeQrWidget extends StatelessWidget {
  final QrCodeService qrCodeService = serviceLocator.get();
  final OnTheFlyChallenge onTheFlyChallenge;

  OnTheFlyChalengeQrWidget({Key? key, required this.onTheFlyChallenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsStore settingsStore = serviceLocator.get();
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    final String jsonChallenge = onTheFlyChallenge.toJson(localizations.qrCodeReadInstructions);
    Colors.black.toString();
    final String qrCodeImage =
        qrCodeService.generateSvgQrCode(text: jsonChallenge, color: settingsStore.isDarkTheme ? 0xffffff : 0x000000);

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
