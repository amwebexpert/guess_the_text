import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:barcode/barcode.dart';
import 'package:guess_the_text/model/on_the_fly_chalenge.dart';
import 'package:guess_the_text/services/logger/logger.service.dart';
import 'package:guess_the_text/store/settings/settings.store.dart';

import '../../theme/theme_utils.dart';

class OnTheFlyChalengeQrWidget extends StatelessWidget {
  final OnTheFlyChalenge onTheFlyChalenge;
  const OnTheFlyChalengeQrWidget({Key? key, required this.onTheFlyChalenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsStore settingsStore = SettingsStore();
    final LoggerService logger = LoggerService();
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    final jsonChallenge = onTheFlyChalenge.toJsonString();
    final qrCode = Barcode.qrCode();
    final qrCodeImage =
        qrCode.toSvg(jsonChallenge, width: 400, height: 400, color: settingsStore.isDarkTheme ? 0xffffff : 0x000000);

    return SafeArea(
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
    );
  }
}
