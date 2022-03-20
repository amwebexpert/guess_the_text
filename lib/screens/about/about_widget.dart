import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_the_text/theme/app_bar/app_bar_title.dart';

import 'about_card_widget.dart';

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
      setState(() {
        isVisible = true;
      });
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
    const String backgroundImage = 'assets/images/background-pexels-pixabay-461940.jpg';

    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: localizations.about),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          )),
          child: AnimatedOpacity(
            opacity: isVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 1000),
            child: const Padding(
              padding: EdgeInsets.all(24.0),
              child: AboutCard(),
            ),
          ),
        ));
  }
}
