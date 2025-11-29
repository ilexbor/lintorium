import 'dart:convert';
import 'dart:io';

void main() async {
  final workspaceDir = _getWorkspaceDir();

  final packages = <String, String>{
    'lintorium': workspaceDir,
    'lintorium_cli': '$workspaceDir/cli',
    'lintorium_example': '$workspaceDir/example',
  };

  await _step1PubGet(packages);
  await _step2AnalysisOptionsValidator(workspaceDir);
  await _step3DartAnalyze(packages);
  await _step4Pana(workspaceDir);
  await _step5DartPublishDryRun(workspaceDir);

  stdout.writeln();
  stdout.writeln('🎉 All checks passed! Package is ready for publishing.');
}

String _getWorkspaceDir() {
  return File(Platform.script.toFilePath()).absolute.parent.parent.parent.path;
}

Future<void> _step1PubGet(Map<String, String> packages) async {
  stdout.writeln('=' * 60);
  stdout.writeln('Step 1: Running `fvm dart pub get` in all packages');
  stdout.writeln('${'=' * 60}\n');

  for (final package in packages.entries) {
    final packageName = package.key;
    final packagePath = package.value;

    stdout.write('📦 Running pub get in $packageName package ($packagePath)...');
    final (exitCode, _) = await _runProcess('fvm', ['dart', 'pub', 'get'], packagePath);

    if (exitCode != 0) {
      stdout.writeln('\n❌ pub get failed in $packageName package. Aborting.');
      exit(1);
    }

    stdout.writeln('✅ pub get completed successfully in $packageName package\n');
  }
}

Future<void> _step2AnalysisOptionsValidator(String workspaceDir) async {
  stdout.writeln('=' * 60);
  stdout.writeln('Step 2: Running analysis options validator');
  stdout.writeln('${'=' * 60}\n');

  stdout.write('🔍 Validating analysis options...');
  final (exitCode, _) = await _runProcess(
    'fvm',
    ['dart', 'run', '$workspaceDir/cli/bin/analysis_options_validator.dart'],
    workspaceDir,
  );

  if (exitCode != 0) {
    stdout.writeln('\n❌ Analysis options validator found issues. Aborting.');
    exit(1);
  }

  stdout.writeln();
  stdout.writeln('✅ Analysis options validator passed\n');
}

Future<void> _step3DartAnalyze(Map<String, String> packages) async {
  stdout.writeln('=' * 60);
  stdout.writeln('Step 3: Running code analyzer');
  stdout.writeln('${'=' * 60}\n');

  for (final package in packages.entries) {
    final packageName = package.key;
    final packagePath = package.value;

    stdout.write('🔍 Analyzing $packageName package ($packagePath)...');
    final result = await _runAnalyzer(packagePath);

    if (!result) {
      stdout.writeln('\n❌ Analyzer found issues in $packageName package. Aborting.');
      exit(1);
    }

    stdout.writeln('✅ Analyzer passed for $packageName package\n');
  }
}

Future<void> _step4Pana(String workspaceDir) async {
  stdout.writeln('=' * 60);
  stdout.writeln('Step 4: Running pana');
  stdout.writeln('${'=' * 60}\n');

  stdout.writeln('🔍 Running pana...');
  final result = await _runPana(workspaceDir);

  if (!result) {
    stdout.writeln('\n❌ Pana found issues. Aborting.');
    exit(1);
  }

  stdout.writeln('✅ Pana check passed\n');
}

Future<void> _step5DartPublishDryRun(String workspaceDir) async {
  stdout.writeln('=' * 60);
  stdout.writeln('Step 5: Running fvm dart publish --dry-run');
  stdout.writeln('${'=' * 60}\n');

  stdout.writeln('📤 Running publish dry-run...');
  final result = await _runPublishDryRun(workspaceDir);

  if (!result) {
    stdout.writeln('\n❌ Publish dry-run found issues. Aborting.');
    exit(1);
  }
}

/// Runs a command with real-time output streaming.
/// Returns exit code and captured output for further analysis.
Future<(int exitCode, String output)> _runProcess(
  String executable,
  List<String> arguments,
  String workingDirectory,
) async {
  final process = await Process.start(
    executable,
    arguments,
    workingDirectory: workingDirectory,
  );

  final outputBuffer = StringBuffer();

  final stdoutFuture = process.stdout.transform(utf8.decoder).forEach((data) {
    stdout.write(data);
    outputBuffer.write(data);
  });

  final stderrFuture = process.stderr.transform(utf8.decoder).forEach((data) {
    stderr.write(data);
    outputBuffer.write(data);
  });

  await Future.wait([stdoutFuture, stderrFuture]);
  final exitCode = await process.exitCode;

  return (exitCode, outputBuffer.toString());
}

/// Runs `fvm dart analyze` and returns true if no errors or warnings found.
Future<bool> _runAnalyzer(String workingDirectory) async {
  final (exitCode, _) = await _runProcess(
    'fvm',
    ['dart', 'analyze', '--fatal-infos', '--fatal-warnings'],
    workingDirectory,
  );

  return exitCode == 0;
}

/// Runs pana and checks for issues.
/// Returns true if pana score is satisfactory (no major issues).
Future<bool> _runPana(String workingDirectory) async {
  // Check if pana is installed
  final checkProcess = await Process.run('fvm', ['dart', 'pub', 'global', 'list']);
  final globalPackages = checkProcess.stdout.toString();

  if (!globalPackages.contains('pana')) {
    stdout.writeln('⚠️  pana is not installed. Installing...');
    final (installExitCode, _) = await _runProcess(
      'dart',
      ['pub', 'global', 'activate', '--overwrite', 'pana'],
      workingDirectory,
    );

    if (installExitCode != 0) {
      stdout.writeln('❌ Failed to install pana');
      return false;
    }
  }

  final flutterSdk = '$workingDirectory/.fvm/flutter_sdk';
  final dartSdk = '$flutterSdk/bin/cache/dart-sdk';

  final (exitCode, output) = await _runProcess(
    'fvm',
    ['dart', 'pub', 'global', 'run', 'pana', '--flutter-sdk', flutterSdk, '--dart-sdk', dartSdk],
    workingDirectory,
  );

  // Check for critical issues in pana output
  if (exitCode != 0) {
    return false;
  }

  // Check if there are any errors or critical warnings
  if (output.contains('ERROR:') || output.contains('[x]')) {
    return false;
  }

  return true;
}

/// Runs `fvm dart pub publish --dry-run` and returns true if no issues found.
Future<bool> _runPublishDryRun(String workingDirectory) async {
  final (exitCode, output) = await _runProcess(
    'fvm',
    ['dart', 'pub', 'publish', '--dry-run'],
    workingDirectory,
  );

  // Check for validation errors
  if (output.contains('Package validation found the following error') ||
      output.contains('Package validation found the following errors')) {
    return false;
  }

  // Check for warnings (treated as errors for strict validation)
  if (output.contains('Package has') && output.contains('warning')) {
    return false;
  }

  return exitCode == 0;
}
