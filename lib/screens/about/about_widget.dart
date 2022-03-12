import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'about_card_widget.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
          title: Text(
            localizations.about,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'IndieFlower',
            ),
          ),
          backgroundColor: Colors.orange[700],
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          )),
          child: const Padding(
            padding: EdgeInsets.all(24.0),
            child: AboutCard(),
          ),
        ));
  }
}
