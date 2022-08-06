# Usefull VSCode and Flutter CLI operations

- [Usefull VSCode and Flutter CLI operations](#usefull-vscode-and-flutter-cli-operations)
  - [Usefull VSCode commands](#usefull-vscode-commands)
  - [Usefull CLI operations](#usefull-cli-operations)
    - [environment info listing](#environment-info-listing)
    - [clean and rebuild](#clean-and-rebuild)
    - [unit tests, widget and integration tests, e2e](#unit-tests-widget-and-integration-tests-e2e)
    - [Start headless android emulator before running e2e tests](#start-headless-android-emulator-before-running-e2e-tests)
    - [Kill android emulator](#kill-android-emulator)
    - [Mockito re-generate `.g.dart` mocks files](#mockito-re-generate-gdart-mocks-files)
    - [MobX re-generate `.g.dart` store files](#mobx-re-generate-gdart-store-files)
  - [Start Flutter app on Simulator or a specific device](#start-flutter-app-on-simulator-or-a-specific-device)

## Usefull VSCode commands

    Command-Shift-P > Dart: Open DevTools Network Page
    Command-Shift-P > Dart: Restart Analysis Server

## Usefull CLI operations

### environment info listing

    echo $FLUTTER_HOME/bin/cache/artifacts
    ll $FLUTTER_HOME/bin/cache/artifacts
    rm -rf $FLUTTER_HOME/bin/cache/artifacts
    flutter doctor -v
    which flutter

### clean and rebuild

    flutter clean
    flutter pub get
    flutter run

### unit tests, widget and integration tests, e2e

    flutter test -r expanded
    flutter test -r expanded test/features/game/letter.widget_test.dart
    flutter test integration_test/app_test.dart
    flutter test integration_test

Steps to see test coverage of the project:

    # Generate code coverage (will be located at 'coverage/lcov.info')
    flutter test --coverage

    # Generate html for test coverage
    # You will need to have lcov installed (`sudo apt install lcov`, `brew install lcov`)
    genhtml coverage/lcov.info -o coverage/html

    # Open the html that's generated
    open coverage/html/index.html

If you want to see test coverage in vscode, take a look at following extensions that can help you out:
- [Flutter Coverage](https://marketplace.visualstudio.com/items?itemName=Flutterando.flutter-coverage) : Calculates test coverage for flutter
- [Coverage Gutters](https://marketplace.visualstudio.com/items?itemName=ryanluker.vscode-coverage-gutters) : Shows you covered and uncovered lines

### Start headless android emulator before running e2e tests

    emulator -list-avds
    emulator -avd  Pixel_5_API_29 -no-audio -no-window

- https://docs.flutter.dev/testing/integration-tests
- [e2e demo recording here](training/recordings/e2e-tests-demo-flutter.mov)


### Kill android emulator

    adb kill-server
    adb emu kill

### Mockito re-generate `.g.dart` mocks files

    flutter pub run build_runner build
    flutter pub run build_runner build --delete-conflicting-outputs

- https://docs.flutter.dev/cookbook/testing/unit/mocking


### MobX re-generate `.g.dart` store files

    flutter packages pub run build_runner build

## Start Flutter app on Simulator or a specific device

    open -a Simulator
    xcrun simctl list
    flutter devices
    flutter run -d "iPhone 13"
    flutter run -d "SM A505W"
