# guess_the_text

Words guess game app in Flutter


## Roadmap

- Store: https://pub.dev/packages/flutter_mobx
- Add I18N support, see https://pub.dev/packages/easy_localization
- Add GuessTheText privacy policy HTML page to BE Server (similar to this http://amwebexpert.users.sourceforge.net/#/privacy-policies/csv-viewer)
- Add bgImage and set the native top status bar color (ref video #33)
- Add .pop and async await navigation approach (ref video #35)
- Apply Flutter Cookbook official site section patterns
- Introduce Lottie animations, see https://pub.dev/packages/lottie
- Add about page informations about the native version but also about the BE API
- Preferences page & shared preferences
- Dark theme mode
- Example of Stack layout
- Animations: Tweens, Physic-based
- Icon of app inside the appBar
- Start loading with in-app storage, and in background download other categories
- flutter build web (c.f. result in build/web/index.html)

## Usefull command lines

    echo $FLUTTER_HOME/bin/cache/artifacts
    ll $FLUTTER_HOME/bin/cache/artifacts
    rm -rf $FLUTTER_HOME/bin/cache/artifacts
    flutter doctor
    which flutter

    flutter clean
    flutter pub get
    flutter run

## Build & Publish to Google Play

- https://docs.flutter.dev/deployment/android
- https://github.com/flutter/flutter/issues/64334

    flutter clean,
    flutter pub get,
    flutter build appbundle --release --no-tree-shake-icons

## Start Flutter app on Simulator or a specific device

    open -a Simulator
    xcrun simctl list
    flutter devices
    flutter run -d "iPhone 13"
    flutter run -d "SM A505W"

#### BE Api (deployed on Heroku)

- https://amw-hangman-api.herokuapp.com/api/v1/categories
- https://amw-hangman-api.herokuapp.com/api/v1/categories/580b0004-d581-49d1-9c84-bddffdb5f3fd/texts


#### App name update

- https://stackoverflow.com/a/56039224/704681


#### App icons generation

- https://pub.dev/packages/flutter_launcher_icons
- https://stackoverflow.com/questions/70580684/flutter-launcher-icons-not-working-unhandled-exception-formatexception-invalid



## Flutter Documentation

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
