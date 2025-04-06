<div align="center">

<h1 style="color:#027DFD; font-family: 'Courier New', 'Courier', monospace; font-weight: 200;">{ LINTORIUM }</h1>

[![](https://img.shields.io/github/v/release/ilexbor/lintorium?style=for-the-badge&logo=github&color=181717&label=GitHub%20Release)](https://github.com/ilexbor/lintorium)
[![](https://img.shields.io/pub/v/lintorium.svg?style=for-the-badge&logo=dart&color=0553B1&label=Pub%20Release)](https://pub.dev/packages/lintorium)
[![](https://img.shields.io/pub/dm/lintorium?style=for-the-badge&logo=dart&color=0553B1&label=Pub%20Downloads)](https://pub.dev/packages/lintorium)
![](https://img.shields.io/github/license/ilexbor/lintorium?style=for-the-badge&color=042B59&label=license)

</div>

The strictest linting rules for Dart code.
Perfect for perfectionists, whether solo developers or entire teams striving for flawless code.

## Compatibility with Dart SDK

Lintorium fully compatible with both **Dart** and **Flutter** projects.

| Dart SDK version | Lintorium version |
|------------------|-------------------|
| \>=3.6.0         | ✅ >=1.6.0         |
| \>=3.5.0         | ✅ >=1.5.0         |
| \>=3.4.0         | ✅ >=1.4.0         |
| \>=3.3.0         | ✅ >=1.3.0         |
| \>=3.2.0         | ✅ >=1.2.0         |
| \>=3.1.0         | ✅ >=1.1.0         |
| \>=3.0.0         | ✅ >=1.0.0         |
| \<3.0.0          | ❌ Not supported   |

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

### Excluding files and directories

You can exclude specific files or directories from analysis by using the `analyzer.exclude` section in your `analysis_options.yaml` file.
This is useful for automatically generated files.

Example:
```yaml
# analysis_options.yaml

include: package:lintorium/analysis_options.yaml

analyzer:
  exclude:
    - "**/generated/**" # Excludes all files in the "generated" directory and its subdirectories
    - "**/*.freezed.dart" # Excludes all files ending with ".freezed.dart"
    - "**/*.g.dart" # Excludes all files ending with ".g.dart"
    - "**/*.gen.dart" # Excludes all files ending with ".gen.dart"
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

## Lintorium badges

Use these badges to highlight your project's adherence to Lintorium's high standards of linting and code style.

### Available badges

Example:

[![](https://img.shields.io/badge/quality%20ensured%20by-lintorium-0553B1)](https://pub.dev/packages/lintorium)  
[![](https://img.shields.io/badge/quality%20ensured%20by-lintorium-0553B1?style=for-the-badge)](https://pub.dev/packages/lintorium)

Markdown:

```markdown
[![](https://img.shields.io/badge/quality%20ensured%20by-lintorium-0553B1)](https://pub.dev/packages/lintorium)
[![](https://img.shields.io/badge/quality%20ensured%20by-lintorium-0553B1?style=for-the-badge)](https://pub.dev/packages/lintorium)
```

### How to add

To include a badge in your project:
1.	Copy the Markdown code snippet for the badge you want.
2.	Paste it into your project’s README.md or documentation file where you want the badge to appear.

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
Please fork this repository and submit pull requests.

## License

This project is licensed under the [BSD-3-Clause License](LICENSE).

---

<div align="center">
  <h2 style="color:#0553B1;">
    Developed with 💙 by <a href="https://github.com/ilexbor" style="text-decoration:none; color:#027DFD;" onmouseover="this.style.color='#0553B1'" onmouseout="this.style.color='#027DFD'">ilexbor</a>
  </h2>
</div>

