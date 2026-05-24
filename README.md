<div align="center">

<h1 style="color:#027DFD; font-family: 'Courier New', 'Courier', monospace; font-weight: 200;">{ LINTORIUM }</h1>

[![](https://img.shields.io/github/v/release/ilexbor/lintorium?style=for-the-badge&logo=github&color=181717&label=GitHub%20Release)](https://github.com/ilexbor/lintorium)
[![](https://img.shields.io/pub/v/lintorium.svg?style=for-the-badge&logo=dart&color=0553B1&label=Pub%20Release)](https://pub.dev/packages/lintorium)
[![](https://img.shields.io/pub/dm/lintorium?style=for-the-badge&logo=dart&color=0553B1&label=Pub%20Downloads)](https://pub.dev/packages/lintorium)
![](https://img.shields.io/github/license/ilexbor/lintorium?style=for-the-badge&color=042B59&label=license)

</div>

A set of strict lint rules for Dart.
While other packages tune the same rules differently per Dart SDK version, lintorium keeps every rule configured the same way across all supported SDKs simultaneously.

## Table of contents

- [Versioning system](#versioning-system)
- [Installation](#installation)
- [Upgrading to the latest lints](#upgrading-to-the-latest-lints)
- [Usage](#usage)
  - [Excluding files and directories](#excluding-files-and-directories)
  - [Suppressing Rules](#suppressing-rules)
  - [Customizing the predefined lint sets](#customizing-the-predefined-lint-sets)
- [Badges](#lintorium-badges)
- [Changelog](#changelog)
- [Issues](#issues)
- [Contributing](#contributing)
- [License](#license)

## Versioning system

Lintorium is fully compatible with both **Dart** and **Flutter** projects.

### Version correlation

The first digit of Lintorium's version number corresponds to the minimum required Dart SDK version.

| Dart SDK version | Lintorium version |
|------------------|-------------------|
| >=3.12.0         | ✅ >=312.0.0       |
| >=3.11.0         | ✅ >=311.0.0       |
| >=3.10.0         | ✅ >=310.0.0       |
| >=3.9.0          | ✅ >=309.0.0       |
| >=3.8.0          | ✅ >=308.0.0       |
| >=3.7.0          | ✅ >=307.0.0       |
| >=3.6.0          | ✅ >=306.0.0       |
| >=3.5.0          | ✅ >=305.0.0       |
| >=3.4.0          | ✅ >=304.0.0       |
| >=3.3.0          | ✅ >=303.0.0       |
| >=3.2.0          | ✅ >=302.0.0       |
| >=3.1.0          | ✅ >=301.0.0       |
| >=3.0.0          | ✅ >=300.0.0       |
| <3.0.0           | ❌ Not supported   |

### Recommended version specification

When adding Lintorium to your project, it's highly recommended to use the greater than or equal to (`>=`) operator:

```yaml
# pubspec.yaml
dev_dependencies:
  lintorium: ">=300.0.0"  # Replace with your required version
```

This approach allows the `dart pub get` and `dart pub upgrade` commands to automatically select the latest Lintorium version that's compatible with your project's Dart SDK, ensuring you always get the latest rules optimized for your Dart SDK version.

### Active support for all Dart SDK versions

**What it means:** Lintorium ships a separate `analysis_options_dart_3_X_0.yaml` for every supported Dart SDK version, all carrying the same ruleset.

**Why it matters:** other linting packages typically support only the latest SDK. With Lintorium, every Dart SDK from 3.0 up to the latest release gets identical lint coverage.

**What you get:** the same rules and analyzer behavior across projects on different Dart SDK versions, so switching between them brings no surprises.

## Installation

1. In a terminal, located at the root of your package, run this command:

   ```shell
    dart pub add dev:lintorium
    ```

2. Create an `analysis_options.yaml` file in the root directory of your project (next to pubspec.yaml) and add the following line:

    ```yaml
    include: package:lintorium/analysis_options.yaml
    ```
   
Now the Dart analyzer will use the rules from Lintorium.

## Upgrading to the latest lints

To upgrade to the latest version of the lint set, run:
```shell
dart pub add dev:lintorium
```

## Usage

Issues detected by the analyzer will automatically appear in the interface of [Dart-compatible IDEs](https://dart.dev/tools#ides-and-editors).

The analyzer can also be run manually from the command line.

For Dart projects, use:
```shell
dart analyze
```

For Flutter projects, use:
```shell
flutter analyze
```

These commands can also be used for running analysis on CI.

### Excluding files and directories

You can exclude specific files or directories from analysis by using the `analyzer.exclude` section in your `analysis_options.yaml` file.
This is useful for automatically generated files.

Example:
```yaml
# analysis_options.yaml

include: package:lintorium/analysis_options.yaml

analyzer:
  exclude:
    - "**/.generated/**"    # Excludes all files in the ".generated" directory and its subdirectories
    - "**/generated/**"     # Excludes all files in the "generated" directory and its subdirectories
    - "**/*.freezed.dart"   # Excludes all files ending with ".freezed.dart"
    - "**/*.g.dart"         # Excludes all files ending with ".g.dart"
    - "**/*.gen.dart"       # Excludes all files ending with ".gen.dart"
    - "**/*.generated.dart" # Excludes all files ending with ".generated.dart"
    - "**/*.gr.dart"        # Excludes all files ending with ".gr.dart"
```

For more details, refer to the [official Dart documentation](https://dart.dev/tools/analysis#excluding-files).

### Suppressing Rules

Sometimes, you may need to suppress specific linting rules for certain sections of your code. Dart allows you to do this by using comments in your code.

#### Suppressing a rule for a specific line

You can suppress a rule by adding a comment above the line of code you want to exclude:

```dart
// ignore: avoid_print
print('This is ignored by the linter');
```

#### Suppressing multiple rules

To suppress multiple rules, list them separated by commas:

```dart
// ignore: avoid_print, avoid_dynamic_calls
print(dynamicVariable.callMethod());
```

#### Ignoring rules for a block of code

To suppress rules for a block of code, you can use ignore comments around the block:

```dart
// ignore: avoid_print
void someFunction() {
  print('This will not trigger a lint warning');
}

// Linting resumes here
```

#### Suppressing rules for an entire file

To suppress rules for an entire file, add a comment at the top of the file:

```dart
// ignore_for_file: avoid_print

import 'dart:io';
...
```

For more details, refer to the [official Dart documentation](https://dart.dev/tools/analysis#suppressing-diagnostics-for-a-file).

### Customizing the predefined lint sets

You can also customize the rules manually using the `linter.rules` or `analyzer.errors` sections in your `analysis_options.yaml` file.
This allows you to enable or disable specific rules to suit your needs.

For a complete list of all available linting rules, you can refer to the [official Dart documentation](https://dart.dev/tools/linter-rules#rules).

The `linter.rules` section lets you enable or disable specific lint rules.

Example:
```yaml
# analysis_options.yaml

linter:
  rules:
    avoid_print: true # Enables the avoid_print rule
    prefer_single_quotes: false # Disables the prefer_single_quotes rule
```

The `analyzer.errors` section allows you to define the severity level for diagnostic messages reported by the analyzer.

Example:
```yaml
# analysis_options.yaml

analyzer:
  errors:
    package_api_docs: info # Shows an informational message
    prefer_is_empty: warning # Shows a warning
    avoid_print: error # Raises an error
    prefer_single_quotes: ignore # Completely disables the rule
```

For details on customizing static analysis, check out the [official Dart documentation](https://dart.dev/tools/analysis).

## Changelog

For a full list of changes and updates, see the [CHANGELOG.md](CHANGELOG.md).

## Issues

If you encounter any issues or have suggestions for improvements, please [create an issue](https://github.com/ilexbor/lintorium/issues/new/choose) on GitHub.

When reporting a bug or requesting a fix, please provide as much detail as possible to help understand the problem or idea.

Including the following information is highly appreciated:
- Steps to reproduce the issue
- Expected behavior
- Any error messages or logs
- Your environment (operating system, Dart version, etc.)

Your feedback is valuable and will help improve the package!

## Contributing

Contributions are welcome!  
Please [fork this repository](https://github.com/ilexbor/lintorium/fork) and [submit pull requests](https://github.com/ilexbor/lintorium/pulls).

By participating in this project, you agree to abide by our [Code of Conduct](CODE_OF_CONDUCT.md).

## License

This project is licensed under the [BSD-3-Clause License](LICENSE).

---

<div align="center">
  <h2 style="color:#0553B1;">
    Developed with 💙 by <a href="https://github.com/ilexbor" style="text-decoration:none; color:#027DFD;" onmouseover="this.style.color='#0553B1'" onmouseout="this.style.color='#027DFD'">ilexbor</a>
  </h2>
</div>

