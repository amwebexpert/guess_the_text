import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/theme/theme.utils.dart';
import '/theme/widgets/animations/scaling.intro.widget.dart';

class OnTheFlyChalengeQrLandscape extends StatelessWidget {
  final String qrCodeImage;

  const OnTheFlyChalengeQrLandscape({Key? key, required this.qrCodeImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: ScalingIntroWidget(child: SvgPicture.string(qrCodeImage))),
        const Flexible(child: InstructionsWidget()),
      ],
    );
  }
}

class InstructionsWidget extends StatelessWidget {
  const InstructionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
        SizedBox(height: spacing(1)),
        ElevatedButton(
          child: Text(localizations.actionClose),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
