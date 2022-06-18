import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/theme/theme.utils.dart';
import 'package:guess_the_text/theme/widgets/app.bar.title.widget.dart';
import 'package:guess_the_text/theme/widgets/full.screen.bg.image.widget.dart';

import 'card.widget.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) {
        setState(() {
          isVisible = true;
        });
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(DeviceOrientation.values.toList());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    const String backgroundImage = 'assets/images/backgrounds/background-pexels-pixabay-461940.jpg';

    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: localizations.about),
        ),
        body: FullScreenAssetBackground(
          assetImagePath: backgroundImage,
          child: AnimatedOpacity(
            opacity: isVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 800),
            child: Padding(
              padding: EdgeInsets.all(spacing(3)),
              child: const AboutCard(),
            ),
          ),
        ));
  }
}
