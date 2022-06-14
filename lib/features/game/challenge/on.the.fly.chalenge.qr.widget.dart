import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guess_the_text/features/game/challenge/on.the.fly.challenge.model.dart';
import 'package:guess_the_text/service.locator.dart';
import 'package:guess_the_text/services/qr/qr.code.service.dart';
import 'package:guess_the_text/theme/theme.utils.dart';
import 'package:guess_the_text/theme/widgets/animations/scaling.intro.widget.dart';

class OnTheFlyChalengeQrWidget extends StatelessWidget {
  final QrCodeService qrCodeService = serviceLocator.get();
  final OnTheFlyChallenge onTheFlyChallenge;

  OnTheFlyChalengeQrWidget({Key? key, required this.onTheFlyChallenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final String jsonChallenge = onTheFlyChallenge.toJson(localizations.qrCodeReadInstructions);
    final color = isDarkTheme ? Colors.black : Colors.white;
    final qrCodeColor = isDarkTheme ? Colors.white.value : Colors.black.value;
    final String qrCodeImage = qrCodeService.generateSvg(text: jsonChallenge, color: qrCodeColor);

    return SafeArea(
      child: Container(
        color: color,
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
                Expanded(child: ScalingIntroWidget(child: SvgPicture.string(qrCodeImage))),
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
