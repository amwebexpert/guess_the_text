import 'package:cli/cli.dart' as cli;

void main() {
  print('Extracting application semver info from pubspec.yaml: ${cli.getAppVersion()}');
  cli.writeAppVersion();
}
