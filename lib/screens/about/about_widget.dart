import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                localizations.about + '... Under construction...',
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'IndieFlower',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ));
  }
}
