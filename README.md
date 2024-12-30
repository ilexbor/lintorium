![Version](https://img.shields.io/pub/v/lintorium.svg)
![Downloads](https://img.shields.io/pub/dt/lintorium.svg)
![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)

The strictest linting rules for Dart code.
Every rule is manually configured.
Perfect for perfectionists, whether solo developers or entire teams striving for flawless code.

## Compatibility

Lintorium requires Dart 3.5.0 or later.

## Installation

Add the package to the `dev_dependencies` in your `pubspec.yaml`:

```yaml
dev_dependencies:
  lintorium: ^0.1.0
```

Then run the command:

```shell
dart pub get
```

## Usage

Create an `analysis_options.yaml` file at the root of your project (next to `pubspec.yaml`) and add the following line:

```yaml
include: package:lintorium/analysis_options.yaml
```

Now the Dart analyzer will use the rules from Lintorium.

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

You can exclude specific files or directories from analysis by using the `analyzer > exclude` section in your `analysis_options.yaml` file.
This is useful for automatically generated files.

Example:
```yaml
# analysis_options.yaml

analyzer:
  exclude:
    - "**/*.g.dart" # Excludes all files ending with ".g.dart"
    - "**/generated/**" # Excludes all files in the "generated" directory
```

### Customizing

You can also customize the rules manually using the `linter > rules` or `analyzer > errors` sections in your `analysis_options.yaml` file.
This allows you to enable or disable specific rules to suit your needs.

The `linter > rules` section lets you enable or disable specific lint rules.

Example:
```yaml
# analysis_options.yaml

linter:
  rules:
    avoid_print: true # Enables the avoid_print rule
    prefer_single_quotes: false # Disables the prefer_single_quotes rule
```

The `analyzer > errors` section allows you to specify the processing level for diagnostic messages.

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

## Changelog

For a full list of changes and updates, see the [CHANGELOG.md](CHANGELOG.md).

## Issues

If you encounter any issues or have suggestions for improvements, please create an issue.

When reporting a bug or requesting a new feature, please provide as much detail as possible to help understand the problem or idea.

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

