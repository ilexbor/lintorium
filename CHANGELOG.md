# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [38.1.0] - 2025-07-22

### Changed
- Added new rules to the `analyzer.exclude` section in `analysis_options.yaml`.
- [BREAKING CHANGE] Enabled the `omit_local_variable_types` rule (previously disabled): May allow previously failing code to pass linting.
- [BREAKING CHANGE] Changed the `omit_obvious_property_types` rule severity from `warning` to `ignore` and disabled it (previously enabled): May affect CI/CD pipelines that enforce strict linting.

## [37.1.0] - 2025-07-22

### Changed
- Added new rules to the `analyzer.exclude` section in `analysis_options.yaml`.
- [BREAKING CHANGE] Enabled the `omit_local_variable_types` rule (previously disabled): May allow previously failing code to pass linting.
- [BREAKING CHANGE] Changed the `omit_obvious_property_types` rule severity from `warning` to `ignore` and disabled it (previously enabled): May affect CI/CD pipelines that enforce strict linting.

## [36.1.0] - 2025-07-22

### Changed
- Added new rules to the `analyzer.exclude` section in `analysis_options.yaml`.
- [BREAKING CHANGE] Changed the `document_ignores` rule severity from `error` to `warning`: May allow previously failing code to pass linting.
- [BREAKING CHANGE] Enabled the `omit_local_variable_types` rule (previously disabled): May allow previously failing code to pass linting.

## [35.1.0] - 2025-07-22

### Changed
- Added new rules to the `analyzer.exclude` section in `analysis_options.yaml`.
- [BREAKING CHANGE] Changed the `document_ignores` rule severity from `error` to `warning`: May allow previously failing code to pass linting.
- [BREAKING CHANGE] Changed the `omit_local_variable_types` rule severity from `error` to `warning`: May allow previously failing code to pass linting.

## [34.1.0] - 2025-07-22

### Changed
- Added new rules to the `analyzer.exclude` section in `analysis_options.yaml`.
- [BREAKING CHANGE] Changed the `omit_local_variable_types` rule severity from `error` to `warning`: May allow previously failing code to pass linting.

## [33.1.0] - 2025-07-22

### Changed
- Added new rules to the `analyzer.exclude` section in `analysis_options.yaml`.
- [BREAKING CHANGE] Changed the `omit_local_variable_types` rule severity from `error` to `warning`: May allow previously failing code to pass linting.

## [32.1.0] - 2025-07-22

### Changed
- Added new rules to the `analyzer.exclude` section in `analysis_options.yaml`.
- [BREAKING CHANGE] Changed the `omit_local_variable_types` rule severity from `error` to `warning`: May allow previously failing code to pass linting.

## [31.1.0] - 2025-07-22

### Changed
- Added new rules to the `analyzer.exclude` section in `analysis_options.yaml`.
- [BREAKING CHANGE] Changed the `omit_local_variable_types` rule severity from `error` to `warning`: May allow previously failing code to pass linting.

## [30.1.0] - 2025-07-22

### Changed
- Added new rules to the `analyzer.exclude` section in `analysis_options.yaml`.
- [BREAKING CHANGE] Changed the `omit_local_variable_types` rule severity from `error` to `warning`: May allow previously failing code to pass linting.

## [38.0.0] - 2025-07-08

### Added
- CLI tool for fast version switching.

### Changed
- [BREAKING CHANGE] Updated minimum Dart SDK version to `>=3.8.0`.
- Updated `README.md`.

## [37.0.0] - 2025-07-08

### Changed
- Updated `README.md`.

## [36.0.0] - 2025-07-07

### Changed
- Updated `README.md`.

## [35.0.0] - 2025-07-07

### Changed
- Updated `README.md`.

## [34.0.0] - 2025-07-07

### Changed
- Updated `README.md`.

## [33.0.0] - 2025-07-07

### Changed
- Updated `README.md`.

## [32.0.0] - 2025-07-07

### Changed
- Updated `README.md`.

## [31.0.0] - 2025-07-07

### Changed
- Updated `README.md`.

## [30.0.0] - 2025-07-07

### Changed
- Updated `README.md`.

## [1.7.0] - 2025-04-06

### Changed
- [BREAKING CHANGE] Updated minimum Dart SDK version to `>=3.7.0`.

## [1.6.0] - 2025-04-06

### Changed
- [BREAKING CHANGE] Updated minimum Dart SDK version to `>=3.6.0`.

## [1.5.0] - 2025-04-06

### Changed
- [BREAKING CHANGE] Updated minimum Dart SDK version to `>=3.5.0`.

## [1.4.0] - 2025-04-06

### Changed
- [BREAKING CHANGE] Updated minimum Dart SDK version to `>=3.4.0`.

## [1.3.0] - 2025-04-06

### Changed
- [BREAKING CHANGE] Updated minimum Dart SDK version to `>=3.3.0`.

## [1.2.0] - 2025-04-06

### Changed
- [BREAKING CHANGE] Updated minimum Dart SDK version to `>=3.2.0`.

## [1.1.0] - 2025-04-06

### Changed
- [BREAKING CHANGE] Updated minimum Dart SDK version to `>=3.1.0`.

## [1.0.0] - 2025-04-06

### Added
- CLI tool for validating the `analysis_options.yaml` file.

### Changed
- [BREAKING CHANGE] Updated minimum Dart SDK version to `>=3.0.0`.
- [BREAKING CHANGE] Changed the `private_optional_parameter` rule severity to `ignore`: May silence errors previously shown in user projects.

### Fixed
- Resolved analyzer warnings when including `package:lintorium/analysis_options.yaml` in a project.

## [0.1.3] - 2025-01-11

### Changed
- Updated documentation for improved clarity and usability.

## [0.1.2] - 2025-01-11

### Changed
- [BREAKING CHANGE] Updated minimum Dart SDK version to `>=3.4.0`.

## [0.1.1] - 2025-01-08

### Changed
- Updated `README.md`, `CHANGELOG.md`, and `LICENSE` for better presentation and readability on `pub.dev`.

## [0.1.0] - 2025-01-08

### Added
- Initial release of the package.