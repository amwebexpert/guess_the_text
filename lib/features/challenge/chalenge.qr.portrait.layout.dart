import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:guess_the_text/theme/theme.utils.dart';
import 'package:guess_the_text/theme/widgets/animations/scaling.intro.widget.dart';

class OnTheFlyChalengeQrPortrait extends StatelessWidget {
  final String qrCodeImage;

  const OnTheFlyChalengeQrPortrait({Key? key, required this.qrCodeImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Column(
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
        SizedBox(height: spacing(1)),
        ElevatedButton(
          child: Text(localizations.actionClose),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
