# guess_the_text

Words guess game app in `Flutter`

Free mobile application originally created to learn the `Flutter` framework in my spare time.

The goal is to learn a technology at the same time as providing a fun and scalable educational tool. The source code of this application is available and may also serve as a learning base for training sessions in `Dart` programming with `Flutter`!

Deployed on:
- [Google Play](https://play.google.com/store/apps/details?id=com.amwebexpert.app.guessthetext.guess_the_text)
- App Store
  - Not yet, will need to create an account and fill in all the forms and go through the approval process
- [Privacy Policy](https://amwebexpert.github.io/guess_the_text/)


## Roadmap

- Add new categories like:
  - [Countries and capitals](https://www.atlas-monde.net/tous-les-pays/)
  - [USA States](https://en.wikipedia.org/wiki/U.S._state)
  - [Liste des langues](https://www.axl.cefan.ulaval.ca/Langues/2vital_expansion_tablo1.htm)
- Check support for spaces and dash characters
- Apply Flutter Cookbook official site section patterns
- Explore FutureBuilder for aync widget building pattern (https://stackoverflow.com/a/51983699/704681)
- Example of Stack layout
- Animations: Tweens, Physic-based
- Icon of app inside the appBar
- Start loading with in-app storage, and in background download other categories
- flutter build web (c.f. result in build/web/index.html)
- usage of LayoutBuilder to know available space (landscape mode)

## Completed so far

### Look & Feel and out of the box components

- Create a Theme and customize Typography (headline6, bodyText2, ...) https://docs.flutter.dev/cookbook/design/themes
- Dark theme mode
- Flexible is a built-in widget in flutter which controls how a child of base flex widgets that are Row, Column, and Flex will fill the space available to it
- The Expanded widget in flutter is shorthand of Flexible with the default fit of FlexFit
- Scroll view, list view, Drawer menu
- Lottie animations while loading
- Prefer SVG images over PNG
- Background images
- Add ability to (input modal) add any text_to_guess on the fly
- Orientation locking
- Conditional layout depending on device orientation
- Example of a FadeIn animation

### I18N

- I18n configurations
- Plugin labels maintenance
- Re-generate ARB (application resource bundle) & Dart: Analysis server

### State management

- setState & InheritedWidget (similar to useState, useContext)
- State management with MobX
- MobX Store annotations via the mobx_codegen package
- Preferences page & shared preferences

### Tests automation

- e2e tests (called "integration tests" by Flutter team https://docs.flutter.dev/cookbook/testing/integration/introduction)
- Testing and code coverage: unit, mocks, widget, e2e

### Dart language

- Modern, functionnal programming, assign fonction to var, deconstruction, named parameters, mixins, elvis operator et bang (? et !), double elvis operator (??), late, etc.
- https://medium.com/flutter-community/the-ultimate-javascript-vs-dart-syntax-guide-2f7d8ad8bde6
- Async API services
- Factory pattern to create services singleton
- Power of Dart extensions
- JSON serialization
- Clone vs copy(...) with adjusted params

### Others

- [barcode generator](https://pub.dev/packages/barcode) to create a text to guess challenge
- [barcode scanner](https://pub.dev/packages/flutter_barcode_scanner) feature to accept (scan) challenge
- Deep link navigation for both platforms


## Usefull command lines

    echo $FLUTTER_HOME/bin/cache/artifacts
    ll $FLUTTER_HOME/bin/cache/artifacts
    rm -rf $FLUTTER_HOME/bin/cache/artifacts
    flutter doctor
    which flutter

    flutter clean
    flutter pub get
    flutter run

## Usefull command lines for unit, widget and integration tests

    flutter test -r expanded

### e2e

    flutter test integration_test/app_test.dart
    flutter test integration_test

#### Start headless android emulator before running e2e tests
    emulator -list-avds
    emulator -avd  Pixel_5_API_29 -no-audio -no-window

- https://docs.flutter.dev/testing/integration-tests
- [e2e demo recording here](docs/recordings/e2e-tests-demo-flutter.mov)


### Mockito

    flutter pub run build_runner build
    flutter pub run build_runner build --delete-conflicting-outputs

- https://docs.flutter.dev/cookbook/testing/unit/mocking


## Usefull VSCode tools

    Command-Shift-P > Dard: Open DevTools Network Page

## Deap links on platforms

### iOS
    xcrun simctl openurl booted guessTheText://com.amwebexpert.app.guessthetext/about
    xcrun simctl openurl booted guessTheText://com.amwebexpert.app.guessthetext/settings

### Android
    adb shell am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "guessTheText://com.amwebexpert.app.guessthetext/about"
    adb shell am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "guessTheText://com.amwebexpert.app.guessthetext/settings"

We can also install a generic deep link opener application like this one:
    https://play.google.com/store/apps/details?id=org.thewheatfield.android.deeplinks

## MobX re-generate .g.dart store files

    flutter packages pub run build_runner build

## i18n re-generage .g.dart localization files

    flutter clean
    flutter pub get
    flutter run

or, within VSCode:

    Dart: Restart Analysis Server


## Build & Publish to Google Play

- https://docs.flutter.dev/deployment/android
- https://github.com/flutter/flutter/issues/64334

    flutter clean
    flutter pub get
    flutter build appbundle --release --no-tree-shake-icons

### Git tag
    git commit -m"feature: my super feature"
    git push
    git tag <my-super-tag>
    git push origin --tags

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


#### App localization

- https://docs.flutter.dev/development/accessibility-and-localization/internationalization
- https://stackoverflow.com/a/62825776/704681


#### App icons generation

- https://pub.dev/packages/flutter_launcher_icons
- https://stackoverflow.com/questions/70580684/flutter-launcher-icons-not-working-unhandled-exception-formatexception-invalid



## Usefull references

- [Banque d'extensions déjà codées](https://pub.dev/packages/dartx)
- [Platform conditional widget rendering - Material / Cupertino management](https://pub.dev/packages/flutter_platform_widgets)
- [Platform conditional widget rendering - Medium article](https://medium.com/flutter/do-flutter-apps-dream-of-platform-aware-widgets-7d7ed7b4624d)


## Troubleshothing

- [Your Code installation appears to be corrupt. Please reinstall](https://stackoverflow.com/a/57712635/704681)
- [Multiple git repository](https://stackoverflow.com/questions/3225862/multiple-github-accounts-ssh-config)
- 
