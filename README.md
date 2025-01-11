<div align="center">

![](https://img.shields.io/github/v/release/ilexbor/lintorium?style=for-the-badge&logo=github&color=181717&label=GitHub%20Release)
![](https://img.shields.io/pub/v/lintorium.svg?style=for-the-badge&logo=dart&color=0553B1&label=Pub%20Release)
![](https://img.shields.io/pub/dm/lintorium?style=for-the-badge&logo=dart&color=0553B1&label=Pub%20Downloads)
![](https://img.shields.io/pub/likes/lintorium?style=for-the-badge&logo=dart&color=0553B1&label=pub%20likes)
![](https://img.shields.io/github/license/ilexbor/lintorium?style=for-the-badge&color=042B59&label=license)

</div>

The strictest linting rules for Dart code.
Perfect for perfectionists, whether solo developers or entire teams striving for flawless code.

## Compatibility

Lintorium requires Dart 3.4.0 or later.

## Installation

Add the package to the `dev_dependencies` in your `pubspec.yaml`:

```yaml
dev_dependencies:
  lintorium: ^0.1.1
```

Then run the command:

```shell
dart pub get
```

## Usage

Create an `analysis_options.yaml` file in the root directory of your project (next to pubspec.yaml) and add the following line:

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

You can exclude specific files or directories from analysis by using the `analyzer.exclude` section in your `analysis_options.yaml` file.
This is useful for automatically generated files.

Example:
```yaml
# analysis_options.yaml

analyzer:
  exclude:
    - "**/generated/**" # Excludes all files in the "generated" directory and its subdirectories
    - "**/*.g.dart" # Excludes all files ending with ".g.dart"
```

### Customizing

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

## Changelog

For a full list of changes and updates, see the [CHANGELOG.md](CHANGELOG.md).

## Issues

If you encounter any issues or have suggestions for improvements, please [create an issue](https://github.com/ilexbor/lintorium/issues/new) on GitHub.

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

