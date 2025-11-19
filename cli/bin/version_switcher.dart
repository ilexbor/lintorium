import 'dart:io';

import 'package:version/version.dart';
import 'package:yaml/yaml.dart';

void main() {
  try {
    final lintoriumVersion = _getLintoriumVersionFromUser();

    final (minDartSdkVersion: minDartSdkVersion, maxDartSdkVersion: maxDartSdkVersion) = _getDartSdkVersions(
      lintoriumVersion,
    );

    stdout.writeln('Lintorium version: $lintoriumVersion');
    stdout.writeln('Dart SDK min version: $minDartSdkVersion');
    stdout.writeln('Dart SDK max version: $maxDartSdkVersion');

    _updateAnalysisOptionsFile(minDartSdkVersion.toString());

    _updatePubspecFile(File('../pubspec.yaml'), minDartSdkVersion, maxDartSdkVersion);
    _updatePubspecFile(File('../example/pubspec.yaml'), minDartSdkVersion, maxDartSdkVersion);

    stdout.writeln('✅ Success');
  } on Exception catch (e) {
    stdout.writeln('⚠️ Error: $e');
    exit(1);
  }
}

Version _getLintoriumVersionFromUser() {
  stdout.writeln();
  stdout.write('Enter lintorium version (or press Enter to use version from pubspec.yaml): ');

  final Version version;

  final input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    version = _getLintoriumVersionFromPubspecFile();
    return version;
  }

  version = Version.parse(input);

  return version;
}

Version _getLintoriumVersionFromPubspecFile() {
  final file = File('../pubspec.yaml');

  if (!file.existsSync()) {
    throw Exception('File `${file.absolute.path}` not found');
  }

  final content = file.readAsStringSync();

  final yaml = loadYaml(content) as Map;

  final versionString = yaml['version'] as String;

  final version = Version.parse(versionString);

  return version;
}

({Version minDartSdkVersion, Version maxDartSdkVersion}) _getDartSdkVersions(Version lintoriumVersion) {
  // Versioning scheme: Dart 3.X.Y -> Lintorium 3XY.x.x
  // Examples: Dart 3.0.0 -> Lintorium 300.x.x, Dart 3.10.5 -> Lintorium 310.x.x

  final major = lintoriumVersion.major;

  if (major < 300) {
    throw Exception(
      'Version `$lintoriumVersion` not supported. Expected Lintorium version in range 300.x.x to 399.x.x',
    );
  }

  // Extract Dart major and minor from Lintorium major version
  // 300 -> 3.0, 310 -> 3.10, 305 -> 3.5
  final dartMajor = major ~/ 100; // 3
  final dartMinor = major % 100; // 0-99

  final minDartSdkVersion = Version(dartMajor, dartMinor, 0);
  final maxDartSdkVersion = Version(dartMajor + 1, 0, 0); // <4.0.0

  return (minDartSdkVersion: minDartSdkVersion, maxDartSdkVersion: maxDartSdkVersion);
}

void _updateAnalysisOptionsFile(String dartVersion) {
  final file = File('../lib/analysis_options.yaml');

  if (!file.existsSync()) {
    throw Exception('analysis_options.yaml not found at ${file.path}');
  }

  final content = file.readAsStringSync();

  final lines = content.split('\n');
  final newLines = <String>[];

  for (final line in lines) {
    if (line.startsWith('include: package:lintorium/analysis_options_dart_')) {
      newLines.add(
        'include: package:lintorium/analysis_options_dart_${dartVersion.replaceAll('.', '_')}.yaml',
      );
    } else {
      newLines.add(line);
    }
  }

  final newContent = newLines.join('\n');

  file.writeAsStringSync(newContent);
}

void _updatePubspecFile(File file, Version minDartSdkVersion, Version maxDartSdkVersion) {
  if (!file.existsSync()) {
    throw Exception('File `${file.absolute.path}` not found');
  }

  final content = file.readAsStringSync();

  final regexp = RegExp(r'(environment:\s*[\r\n]+\s+sdk:\s*).*([\r\n])');

  final updatedContent = content.replaceAllMapped(regexp, (match) {
    return "${match.group(1)}'>=$minDartSdkVersion <$maxDartSdkVersion'${match.group(2)}";
  });

  file.writeAsStringSync(updatedContent);
}
