import 'dart:io';

import 'package:collection/collection.dart';
import 'package:yaml/yaml.dart';

void main() {
  final files = [
    'lib/analysis_options_dart_3_0_0.yaml',
    'lib/analysis_options_dart_3_1_0.yaml',
    'lib/analysis_options_dart_3_2_0.yaml',
    'lib/analysis_options_dart_3_3_0.yaml',
    'lib/analysis_options_dart_3_4_0.yaml',
    'lib/analysis_options_dart_3_5_0.yaml',
    'lib/analysis_options_dart_3_6_0.yaml',
    'lib/analysis_options_dart_3_7_0.yaml',
  ].map(File.new);

  _processFiles(files);
}

void _processFiles(Iterable<File> files) {
  for (final file in files) {
    stdout.writeln();
    stdout.writeln('Process file `${file.path}:');

    final isFileValid = _processFile(file);

    if (isFileValid) {
      stdout.writeln('✅ All checks passed');
    }
  }
}

bool _processFile(File file) {
  final yamlMap = _parseFile(file);

  final analyzerErrors = _parseAnalyzerErrors(yamlMap);
  final linterRules = _parseLinterRules(yamlMap);

  var isFileValid = true;

  isFileValid =
      isFileValid &&
      _validateAnalyzerErrorsForMissingRules(analyzerErrors: analyzerErrors, linterRules: linterRules);
  isFileValid =
      isFileValid &&
      _validateLinterRulesForMissingRules(analyzerErrors: analyzerErrors, linterRules: linterRules);

  isFileValid = isFileValid && _validateAnalyzerErrorsAreSorted(analyzerErrors);
  isFileValid = isFileValid && _validateLinterRulesAreSorted(linterRules);

  return isFileValid;
}

YamlMap _parseFile(File file) {
  if (!file.existsSync()) {
    stderr.writeln('File `${file.path}` not found.');
    exit(1);
  }

  final fileContent = file.readAsStringSync();

  final yamlMap = loadYaml(fileContent) as YamlMap;

  return yamlMap;
}

Iterable<String> _parseAnalyzerErrors(YamlMap yaml) {
  final analyzerSection = yaml['analyzer'];

  if (analyzerSection is! YamlMap) {
    throw UnsupportedError('');
  }

  final errorsSection = analyzerSection['errors'];

  if (errorsSection is! YamlMap) {
    throw UnsupportedError('');
  }

  final errors = errorsSection.keys;

  final result = errors.whereType<String>();

  if (result.length != errors.length) {
    throw StateError('');
  }

  return result;
}

Iterable<String> _parseLinterRules(YamlMap yaml) {
  final linterSection = yaml['linter'];

  if (linterSection is! YamlMap) {
    throw UnsupportedError('');
  }

  final rulesSection = linterSection['rules'];

  if (rulesSection is! YamlMap) {
    throw UnsupportedError('');
  }

  final rules = rulesSection.keys;

  final result = rules.whereType<String>();

  if (result.length != rules.length) {
    throw StateError('');
  }

  return result;
}

bool _validateAnalyzerErrorsForMissingRules({
  required Iterable<String> analyzerErrors,
  required Iterable<String> linterRules,
}) {
  var isValid = true;

  final missingRules = analyzerErrors.where((rule) => !linterRules.contains(rule)).toList();

  missingRules.remove('private_optional_parameter');

  if (missingRules.isNotEmpty) {
    stdout.writeln('⚠️ The following rules from analyzer.errors are missing in linter.rules:');

    for (final rule in missingRules) {
      stdout.writeln('- $rule');
    }

    isValid = false;
  }

  return isValid;
}

bool _validateLinterRulesForMissingRules({
  required Iterable<String> analyzerErrors,
  required Iterable<String> linterRules,
}) {
  var isValid = true;

  final missingRules = linterRules.where((rule) => !analyzerErrors.contains(rule)).toList();

  if (missingRules.isNotEmpty) {
    stdout.writeln('⚠️ The following rules from linter.rules are missing in analyzer.errors:');

    for (final rule in missingRules) {
      stdout.writeln('- $rule');
    }

    isValid = false;
  }

  return isValid;
}

bool _validateAnalyzerErrorsAreSorted(Iterable<String> analyzerErrors) {
  final original = analyzerErrors.toList();
  final sorted = analyzerErrors.toList()..sort();

  final isEquals = const ListEquality<String>().equals(original, sorted);

  if (!isEquals) {
    stdout.writeln('⚠️ Rules in analyzer.errors are not sorted alphabetically:');

    for (final rule in original) {
      stdout.writeln('- $rule');
    }

    stdout.writeln();
    stdout.writeln('Expected order:');

    for (final rule in sorted) {
      stdout.writeln('- $rule');
    }

    return false;
  }

  return true;
}

bool _validateLinterRulesAreSorted(Iterable<String> linterRules) {
  final original = linterRules.toList();
  final sorted = linterRules.toList()..sort();

  final isEquals = const ListEquality<String>().equals(original, sorted);

  if (!isEquals) {
    stdout.writeln('⚠️ Rules in linter.rules are not sorted alphabetically:');

    for (final rule in original) {
      stdout.writeln('- $rule');
    }

    stdout.writeln();
    stdout.writeln('Expected order:');

    for (final rule in sorted) {
      stdout.writeln('- $rule');
    }

    return false;
  }

  return true;
}
