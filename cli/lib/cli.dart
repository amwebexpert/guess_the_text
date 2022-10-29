import 'dart:convert';

import 'package:yaml/yaml.dart';
import 'dart:io';

String getAppVersion() {
  File f = File("../pubspec.yaml");

  final data = f.readAsStringSync(encoding: utf8);
  Map yaml = loadYaml(data);

  return yaml['version'];
}

void writeAppVersion() {
  File f = File("../semver.txt");
  final fullVersion = getAppVersion();
  final versionParts = fullVersion.split('+');
  f.writeAsStringSync(versionParts.first);
}
