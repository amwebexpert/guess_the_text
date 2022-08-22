# References

- [References](#references)
  - [Usefull references](#usefull-references)
  - [Troubleshothing](#troubleshothing)
  - [Hangman gaming resources](#hangman-gaming-resources)
    - [Images and backgrounds](#images-and-backgrounds)

## Usefull references

- [Build and release an Android app](https://docs.flutter.dev/deployment/android)
- [App localization](https://docs.flutter.dev/development/accessibility-and-localization/internationalization)
- [Flutter locales explained](https://stackoverflow.com/a/62825776/704681)
- [App name update](https://stackoverflow.com/a/56039224/704681)
- [App icons generation](https://pub.dev/packages/flutter_launcher_icons)
- [Existing Dart language extensions](https://pub.dev/packages/dartx)
- [Platform conditional widget rendering - Material / Cupertino management](https://pub.dev/packages/flutter_platform_widgets)
- [Platform conditional widget rendering - Medium article](https://medium.com/flutter/do-flutter-apps-dream-of-platform-aware-widgets-7d7ed7b4624d)
- [Choose an open source license](https://choosealicense.com/)
- [Shields badges for Github projects](https://shields.io/)


## Troubleshothing

- [Execution failed for task ':app:compileFlutterBuildRelease'](https://github.com/flutter/flutter/issues/64334)
- [App icons generation Troubleshothing](https://stackoverflow.com/questions/70580684/flutter-launcher-icons-not-working-unhandled-exception-formatexception-invalid)
- [Your Code installation appears to be corrupt. Please reinstall](https://stackoverflow.com/a/57712635/704681)
- [Multiple git repository](https://stackoverflow.com/questions/3225862/multiple-github-accounts-ssh-config)
- `app_localizations.dart` / `AppLocalizations` generated i18n artefacts not found
  - Command-Shift-P > Dart: Restart Analysis Server
  - this will re-detect `.g.dart` localization files
- CORS issues for web platform support
  - rm $FLUTTER_HOME/bin/cache/flutter_tools.stamp
  - code $FLUTTER_HOME/packages/flutter_tools/lib/src/web/chrome.dart
  - add '--disable-web-security' as per [instructions here](https://stackoverflow.com/a/66879350/704681)
- [Error: Unsupported operation: Platform._localeName](https://stackoverflow.com/a/69922286/704681)
- [CocoaPods not installed or not in valid state](https://stackoverflow.com/a/65026366/704681)
  - flutter clean
  - start the iPhone simulator
  - flutter run

## Hangman gaming resources

- [Wikitionary frequent french word list](https://fr.wiktionary.org/wiki/Wiktionnaire:Liste_de_1750_mots_fran%C3%A7ais_les_plus_courants#top-page)
- [Wikitionary basic english word list](https://en.wiktionary.org/wiki/Appendix:Basic_English_word_list)
- [Wikipedia list of animal names](https://en.wikipedia.org/wiki/List_of_animal_names)
- [WikiMedia dev portal](https://developer.wikimedia.org/use-content/content/)
- [Another Flutter Hangman project](https://github.com/tavasolireza/Hangman-Game-Flutter)
- [Huge free french words list](https://www.freelang.com/dictionnaire/dic-francais.php#google_vignette)

### Images and backgrounds

- [Beach Pictures | Download Free Images on Unsplash](https://unsplash.com/s/photos/beach)
- [Happy robot 1](https://freesvg.org/happy-robot)
- [Happy robot 2](https://freesvg.org/happy-robot-remix)
- [Happy robot 3](https://freesvg.org/1528841367)
- [InkScape SVG editor](https://inkscape.org/release/inkscape-1.2/)
