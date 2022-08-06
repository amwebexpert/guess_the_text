# Platforms support

- [Add support for a new platform](https://stackoverflow.com/a/66214067/704681)

    flutter create --platforms=web,macos,windows,linux,android,ios .

## Build & Publish Webapp

- create a branch
- adjust the semversion of `pubspec.yaml` first
- execute the script: `./scripts/build-web.sh`. Then the webapp will be available under `/build/web` folder.

Update the online demo deployed as GitHub pages by doing this additional step:

- execute the script: `./scripts/publish-web.sh`

## Build Android bundle

- create a branch
- adjust the semversion of `pubspec.yaml` first
- execute the script: `./scripts/build-android.sh`. Then the android bundle will be available under `/build/app/outputs/bundle/release/app-release.aab` folder.
- publish the app on Google Play by uploading the `.abb` file from the Google Play Console

## Build & Run Linux build

- create a branch
- adjust the semversion of `pubspec.yaml` first
- execute the script: `./scripts/build-linux.sh`. Flutter will build the application for linux, an executable will be found at following path: `/build/linux/x64/release/bundle`

From there, just run the `guess_the_text` executable to run the build!

## Build & Run Windows build

- create a branch
- adjust the semversion of `pubspec.yaml` first
- execute the script: `./scripts/build-windows.cmd`. Flutter will build the application for Windows (binary `exe` file) an result will be found under: `build\windows\runner\Release`

From there, just run the `guess_the_text.exe` to run the build on Windows!

## Build & Run on macOS

- create a branch
- adjust the semversion of `pubspec.yaml` first
- execute the script: `./scripts/build-macos.sh`. Flutter will build the application for linux, an executable will be found at following path: `/build/macos/Build/Products/Release`

From there, just run the `guess_the_text.app` to run the app!



### References

- [Build and release a web app](https://docs.flutter.dev/deployment/web)
- [Building Windows apps with Flutter](https://docs.flutter.dev/development/platform-integration/windows/building)


