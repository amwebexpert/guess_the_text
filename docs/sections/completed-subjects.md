## Completed so far

List of demonstrated elements inside the codebase, divided by categories

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
- FutureBuilder for aync widget building pattern (https://stackoverflow.com/a/51983699/704681)

### I18N

- I18n configurations
- Plugin labels maintenance
- Re-generate ARB (application resource bundle) & Dart: Analysis server

### State management

- Simple out of the box state management (setState similar to React.useState)
- Not demonstrated: InheritedWidget similar to React useContext because we've picked MobX (see below)
- State management with MobX
- MobX Store annotations via the mobx_codegen package
- FutureBuilder for aync widget building pattern (https://stackoverflow.com/a/51983699/704681)
- MobX reaction and disposers
- Preferences page

### Local storages

- Local storage using [Shared Preferences](https://pub.dev/packages/shared_preferences) for user settings
- Usage of NoSQL database [Sembast solution](https://pub.dev/packages/sembast) to persisted guessed texts

### Dependencies injection (a.k.a. inversion of control IoC, Service locator)

- [get_it](https://pub.dev/packages/get_it)
- GetIt integration with Mockito for testing Widget and other services

### Tests automation

- e2e tests (called "integration tests" by Flutter team https://docs.flutter.dev/cookbook/testing/integration/introduction)
- Testing and code coverage: unit, mocks, widget, e2e

### Animations

- AnimationController with SingleTickerProviderStateMixin
- Tween and TweenSequence
- RotationTransition, AnimatedOpacity
- Example of Staggered animations through CurvedAnimation and intervals

### Dart language

- Modern, functionnal programming, assign fonction to var, deconstruction, named parameters, mixins, elvis operator et bang (? et !), double elvis operator (??), late, etc.
- https://medium.com/flutter-community/the-ultimate-javascript-vs-dart-syntax-guide-2f7d8ad8bde6
- Async API services
- Factory pattern to create services singleton
- Power of Dart extensions
- JSON serialization
- Clone vs copy(...) with adjusted params

### Deap links on platforms

#### iOS
    xcrun simctl openurl booted guessTheText://com.amwebexpert.app.guessthetext/about
    xcrun simctl openurl booted guessTheText://com.amwebexpert.app.guessthetext/settings

#### Android
    adb shell am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "guessTheText://com.amwebexpert.app.guessthetext/about"
    adb shell am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "guessTheText://com.amwebexpert.app.guessthetext/settings"

We can also install a generic deep link opener application like this one:
    https://play.google.com/store/apps/details?id=org.thewheatfield.android.deeplinks


### Others

- [barcode generator](https://pub.dev/packages/barcode) to create a text to guess challenge
- [barcode scanner](https://pub.dev/packages/flutter_barcode_scanner) feature to accept (scan) challenge
- Deep link navigation for both platforms

