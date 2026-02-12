import 'dart:convert';
import 'dart:io';

import 'package:version/version.dart';
import 'package:yaml/yaml.dart';

Future<void> main() async {
  try {
    final lintoriumVersion = _getLintoriumVersionFromPubspecFile();

    stdout.writeln('Lintorium version: $lintoriumVersion');

    final (:minDartSdkVersion, :maxDartSdkVersion) = _getDartSdkVersions(lintoriumVersion);

    stdout.writeln('Dart SDK min version: $minDartSdkVersion');
    stdout.writeln('Dart SDK max version: $maxDartSdkVersion');

    await _switchDartVersion(minDartSdkVersion, maxDartSdkVersion);

    await _runDartVersion();

    await _runPubGet();

    stdout.writeln();
    stdout.writeln('✅ Success');
  } on Exception catch (e) {
    stdout.writeln('⚠️ Error: $e');
    exit(1);
  }
}

String _getWorkspaceDir() {
  return File(Platform.script.toFilePath()).absolute.parent.parent.parent.path;
}

Version _getLintoriumVersionFromPubspecFile() {
  final pubspecYamlFile = File('${_getWorkspaceDir()}/pubspec.yaml');

  if (!pubspecYamlFile.existsSync()) {
    throw Exception('File `${pubspecYamlFile.absolute.path}` not found');
  }

  final content = pubspecYamlFile.readAsStringSync();

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

Future<void> _switchDartVersion(Version minDartSdkVersion, Version maxDartSdkVersion) async {
  await _runMiseUse(minDartSdkVersion);
  _updateAnalysisOptionsFile(minDartSdkVersion.toString());
  _updatePubspecYamlFile(
    File('${_getWorkspaceDir()}/pubspec.yaml'),
    minDartSdkVersion,
    maxDartSdkVersion,
  );
  _updatePubspecYamlFile(
    File('${_getWorkspaceDir()}/cli/pubspec.yaml'),
    minDartSdkVersion,
    maxDartSdkVersion,
  );
  _updatePubspecYamlFile(
    File('${_getWorkspaceDir()}/example/pubspec.yaml'),
    minDartSdkVersion,
    maxDartSdkVersion,
  );
}

Future<void> _runMiseUse(Version dartSdkVersion) async {
  final version = '${dartSdkVersion.major}.${dartSdkVersion.minor}.${dartSdkVersion.patch}';

  stdout.writeln();
  stdout.writeln('> mise use dart@$version');

  final exitCode = await _runProcess('mise', ['use', 'dart@$version'], _getWorkspaceDir());

  if (exitCode != 0) {
    throw Exception('Failed to run mise use dart@$version');
  }
}

void _updateAnalysisOptionsFile(String dartVersion) {
  final file = File('${_getWorkspaceDir()}/lib/analysis_options.yaml');

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

void _updatePubspecYamlFile(File file, Version minDartSdkVersion, Version maxDartSdkVersion) {
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

Future<int> _runProcess(String executable, List<String> arguments, String workingDirectory) async {
  final process = await Process.start(executable, arguments, workingDirectory: workingDirectory);

  final stdoutFuture = process.stdout.transform(utf8.decoder).forEach((data) {
    stdout.write(data);
  });

  final stderrFuture = process.stderr.transform(utf8.decoder).forEach((data) {
    stderr.write(data);
  });

  await Future.wait([stdoutFuture, stderrFuture]);
  return process.exitCode;
}

Future<void> _runDartVersion() async {
  stdout.writeln();
  stdout.writeln('> dart --version');

  await _runProcess('mise', ['exec', '--', 'dart', '--version'], _getWorkspaceDir());
}

Future<void> _runPubGet() async {
  final packages = [_getWorkspaceDir(), '${_getWorkspaceDir()}/cli', '${_getWorkspaceDir()}/example'];

  for (final packageDir in packages) {
    stdout.writeln();
    stdout.writeln('> dart pub get (in $packageDir)');

    final exitCode = await _runProcess('mise', ['exec', '--', 'dart', 'pub', 'get'], packageDir);

    if (exitCode != 0) {
      throw Exception('Failed to run pub get in $packageDir');
    }
  }
}
