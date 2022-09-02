# Completed so far

List of demonstrated elements inside the codebase, divided by categories

- [Completed so far](#completed-so-far)
  - [Look & Feel, layouts & components](#look--feel-layouts--components)
  - [Dart Packages & Plugins](#dart-packages--plugins)
  - [I18N](#i18n)
  - [State management](#state-management)
  - [Local storages](#local-storages)
  - [Dependencies injection (a.k.a. inversion of control IoC, Service locator)](#dependencies-injection-aka-inversion-of-control-ioc-service-locator)
  - [Flutter custom packages and plugins](#flutter-custom-packages-and-plugins)
  - [Tests automation](#tests-automation)
  - [Animations](#animations)
  - [Dart language](#dart-language)
  - [Deap links on platforms](#deap-links-on-platforms)
    - [iOS](#ios)
    - [Android](#android)
    - [Testing with another native application](#testing-with-another-native-application)
    - [Testing with a classic QR Code scanner](#testing-with-a-classic-qr-code-scanner)
  - [Others](#others)

## Look & Feel, layouts & components

- Create a Theme and customize Typography (headline6, bodyText2, ...) https://docs.flutter.dev/cookbook/design/themes
- Dark theme mode
- `Flexible` is a built-in widget in flutter which controls how a child of base flex widgets that are `Row`, `Column`, and `Flex` will fill the space available to it
- The `Expanded` widget in flutter is shorthand of Flexible with the default fit of FlexFit
- Scroll view, list view, Drawer menu, NavigationRail, BottomNavigationBar
- Images: prefer `SVG` images over `PNG`, widget background images
- Add ability to (input modal) add any text_to_guess on the fly
- Orientation locking
- Responsive conditional layout depending on device orientation (see `ResponsiveNavigationRailOrBar` custom reusable widget)
- `FutureBuilder` for aync widget building pattern (https://stackoverflow.com/a/51983699/704681)
- building a form with fields validation on submit and validation errors displayed
- usage of _swipe to delete_ behavior with both confirmation and undo approaches

## Dart Packages & Plugins

- Example of a [Dart package here](https://github.com/amwebexpert/guess_the_text/tree/master/orientation_aware_widgets)
- Example of a [Dart plugin here](https://github.com/amwebexpert/guess_the_text/tree/master/os_console_logger) (implementations available for `Android`, `iOS`, `macOS`, `webapp`)

## I18N

- I18n configurations
- Plugin labels maintenance
- Re-generate ARB (application resource bundle) & Dart: Analysis server

## State management

- Simple out of the box state management (setState similar to React.useState)
- Not demonstrated: InheritedWidget similar to React useContext because we've picked MobX (see below)
- State management with `MobX`
- `MobX` Store annotations via the mobx_codegen package
- `FutureBuilder` for aync widget building pattern (https://stackoverflow.com/a/51983699/704681)
- `MobX` reaction and disposers
- Preferences page, device stored categories

## Local storages

- Local storage using [Shared Preferences](https://pub.dev/packages/shared_preferences) for user settings
- Classic [text files read/write](https://docs.flutter.dev/cookbook/persistence/reading-writing-files) (see `FileService`)
- Usage of NoSQL database [Sembast solution](https://pub.dev/packages/sembast) to persist guessed texts
- Usage of SQL database [SQFlite solution](https://pub.dev/packages/sqflite) to store device categories

## Dependencies injection (a.k.a. inversion of control IoC, Service locator)

- [get_it](https://pub.dev/packages/get_it)
- `GetIt` integration with Mockito for testing Widget and other services

## Flutter custom packages and plugins

- ✔️ creation of a Flutter package (see `orientation_aware_widgets` folder at the root of this project)
- work in progress 👷‍♂️ creation of a Flutter plugin (stay tuned :-))

## Tests automation

- `e2e` tests (called "integration tests" by Flutter team https://docs.flutter.dev/cookbook/testing/integration/introduction)
- Testing and code coverage: unit, mocks, widget, e2e

## Animations

- many `Lottie` animation exampls
- `AnimationController` with `SingleTickerProviderStateMixin`
- Usage of `GestureDetector` for horizontal flipper widget with 3D effect
- `Tween` and `TweenSequence`
- `RotationTransition`, `AnimatedOpacity`
- Examples of `Staggered` animation through `CurvedAnimation` and intervals
- Examples of `FadeIn` animation
- Examples of `animated_text_kit` lib usage
- Re-use animation through a behavioral wrapper widget with a child attribute
- [Hero animations](https://docs.flutter.dev/development/ui/animations/hero-animations)

## Dart language

- Modern, functionnal programming, assign fonction to var, deconstruction, named parameters, mixins, elvis operator et bang (? et !), double elvis operator (??), late, etc.
- https://medium.com/flutter-community/the-ultimate-javascript-vs-dart-syntax-guide-2f7d8ad8bde6
- Async API services
- Factory pattern to create services singleton
- Power of `Dart` extensions
- `JSON` serialization and common class methods (`copyWith`, `toString`, `equals`, `hashCode` ...)
- `Clone` vs `copy(...)` with adjusted params

## Deap links on platforms

The required [configuration for both Android and iOS](https://docs.flutter.dev/development/ui/navigation/deep-linking) is done. This means the application can be opened by other apps, like native QR Code scanner apps. Deep links are also testable on command line using a simulator or a real connected device as explained below.

### iOS
    xcrun simctl openurl booted guessTheText://com.amwebexpert.app.guessthetext/about
    xcrun simctl openurl booted guessTheText://com.amwebexpert.app.guessthetext/settings

### Android
    adb shell am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "guessTheText://com.amwebexpert.app.guessthetext/about"
    adb shell am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "guessTheText://com.amwebexpert.app.guessthetext/settings"

### Testing with another native application

We can also install a generic deep link opener application like this one:
    https://play.google.com/store/apps/details?id=org.thewheatfield.android.deeplinks

### Testing with a classic QR Code scanner

1. use a [QR Code generator](https://amwebexpert.github.io/etoolbox/#/QRCodeGenerator)
2. generate the QR Code with the content: "guessTheText://com.amwebexpert.app.guessthetext/about"
3. now the code is showing on screen, scan it with your prefered QR code scanner native application
4. when your application is showing the link you can press it


## Others

- [barcode generator](https://pub.dev/packages/barcode) to create a text to guess challenge
- [barcode scanner](https://pub.dev/packages/flutter_barcode_scanner) feature to accept (scan) challenge
- [connectivity_plus](https://pub.dev/packages/connectivity_plus) to handle network connection state
- [Freezed](https://pub.dev/packages/freezed) library to generate boilerplate methods like: toString, toJson, fromJson, copyWith, equals, hashcode
