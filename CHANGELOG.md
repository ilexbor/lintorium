# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [314.0.0] - 2026-11-22

### Added
- Enabled the `future_sync_value` rule with `warning` severity.
- Enabled the experimental `unnecessary_this_alias` rule with `warning` severity. In Dart 3.14, this check requires the `this-promotion` language experiment.

### Changed
- [BREAKING CHANGE] Updated minimum Dart SDK version to `>=3.14.0` and switched the default analysis profile to Dart 3.14.

## [313.0.0] - 2026-11-22

### Added
- Enabled the `async_return_with_no_await` rule with `error` severity.
- Enabled the `no_dynamic_casts` rule with `error` severity.
- Enabled the `no_raw_types` rule with `error` severity.
- Enabled the `empty_container_bodies` rule with `warning` severity.
- Enabled the `initialize_in_field_declaration` rule with `warning` severity.
- Enabled the `migrate_design_widgets` rule with `warning` severity.
- Enabled the `unnecessary_const_in_enum_constructor` rule with `warning` severity.
- Enabled the `unnecessary_primary_constructor_body` rule with `warning` severity.
- Enabled the `unnecessary_type_name_in_constructor` rule with `warning` severity.
- Enabled the `use_declaring_parameters` rule with `warning` severity.
- Added `use_primary_constructors` as a disabled rule.

### Changed
- [BREAKING CHANGE] Updated minimum Dart SDK version to `>=3.13.0` and switched the default analysis profile to Dart 3.13.
- Replaced `strict-raw-types` with the `no_raw_types` lint, configured with `error` severity.
- Marked `avoid_private_typedef_functions`, `one_member_abstracts`, and `unnecessary_await_in_return` as deprecated in Dart 3.13.

## [312.1.0] - 2026-11-22

### Added
- [BREAKING CHANGE] Enabled the experimental `var_with_no_type_annotation` rule with `error` severity. Untyped parameters declared with `var` now produce an additional analysis error.
- Added an explicit disabled setting for `remove_deprecations_in_breaking_versions`.

### Changed
- Disabled the `avoid_field_initializers_in_const_classes` rule (previously `warning`) to keep shared rule settings consistent across supported SDKs.
- Disabled the `unnecessary_await_in_return` rule (previously `error`) to keep shared rule settings consistent across supported SDKs.
- Updated the status comments for `omit_obvious_local_variable_types`, `omit_obvious_property_types`, `specify_nonobvious_local_variable_types`, and `specify_nonobvious_property_types` to reflect their stable status.

## [311.1.0] - 2026-11-22

### Added
- Added an explicit disabled setting for `remove_deprecations_in_breaking_versions`.

### Changed
- Disabled the `avoid_field_initializers_in_const_classes` rule (previously `warning`) to keep shared rule settings consistent across supported SDKs.
- Disabled the `unnecessary_await_in_return` rule (previously `error`) to keep shared rule settings consistent across supported SDKs.
- Updated the status comments for `omit_obvious_local_variable_types`, `omit_obvious_property_types`, `specify_nonobvious_local_variable_types`, and `specify_nonobvious_property_types` to reflect their stable status.

## [310.1.0] - 2026-11-22

### Added
- Added an explicit disabled setting for `remove_deprecations_in_breaking_versions`.

### Changed
- Disabled the `avoid_field_initializers_in_const_classes` rule (previously `warning`) to keep shared rule settings consistent across supported SDKs.
- Disabled the `unnecessary_await_in_return` rule (previously `error`) to keep shared rule settings consistent across supported SDKs.

## [309.1.0] - 2026-11-22

### Changed
- Disabled the `avoid_field_initializers_in_const_classes` rule (previously `warning`) to keep shared rule settings consistent across supported SDKs.
- Disabled the `unnecessary_await_in_return` rule (previously `error`) to keep shared rule settings consistent across supported SDKs.

## [308.1.0] - 2026-11-22

### Changed
- Disabled the `avoid_field_initializers_in_const_classes` rule (previously `warning`) to keep shared rule settings consistent across supported SDKs.
- Disabled the `unnecessary_await_in_return` rule (previously `error`) to keep shared rule settings consistent across supported SDKs.

## [307.1.0] - 2026-11-22

### Changed
- Disabled the `avoid_field_initializers_in_const_classes` rule (previously `warning`) to keep shared rule settings consistent across supported SDKs.
- Disabled the `unnecessary_await_in_return` rule (previously `error`) to keep shared rule settings consistent across supported SDKs.

## [306.1.0] - 2026-11-22

### Changed
- Disabled the `avoid_field_initializers_in_const_classes` rule (previously `warning`) to keep shared rule settings consistent across supported SDKs.
- Disabled the `unnecessary_await_in_return` rule (previously `error`) to keep shared rule settings consistent across supported SDKs.

## [305.1.0] - 2026-11-22

### Changed
- Disabled the `avoid_field_initializers_in_const_classes` rule (previously `warning`) to keep shared rule settings consistent across supported SDKs.
- Disabled the `unnecessary_await_in_return` rule (previously `error`) to keep shared rule settings consistent across supported SDKs.

## [304.1.0] - 2026-11-22

### Changed
- Disabled the `avoid_field_initializers_in_const_classes` rule (previously `warning`) to keep shared rule settings consistent across supported SDKs.
- Disabled the `unnecessary_await_in_return` rule (previously `error`) to keep shared rule settings consistent across supported SDKs.

## [303.1.0] - 2026-11-22

### Changed
- Disabled the `avoid_field_initializers_in_const_classes` rule (previously `warning`) to keep shared rule settings consistent across supported SDKs.
- Disabled the `unnecessary_await_in_return` rule (previously `error`) to keep shared rule settings consistent across supported SDKs.

## [302.1.0] - 2026-11-24

### Changed
- Disabled the `avoid_field_initializers_in_const_classes` rule (previously `warning`) to keep shared rule settings consistent across supported SDKs.
- Disabled the `unnecessary_await_in_return` rule (previously `error`) to keep shared rule settings consistent across supported SDKs.
- Disabled `iterable_contains_unrelated_type` and `list_remove_unrelated_type` to avoid duplicate diagnostics. Their replacement, `collection_methods_unrelated_type`, remains enabled with `error` severity.

## [301.1.0] - 2026-11-24

### Changed
- Disabled the `avoid_field_initializers_in_const_classes` rule (previously `warning`) to keep shared rule settings consistent across supported SDKs.
- Disabled the `unnecessary_await_in_return` rule (previously `error`) to keep shared rule settings consistent across supported SDKs.
- Disabled `iterable_contains_unrelated_type` and `list_remove_unrelated_type` to avoid duplicate diagnostics. Their replacement, `collection_methods_unrelated_type`, remains enabled with `error` severity.

## [300.1.0] - 2026-11-24

### Changed
- Disabled the `avoid_field_initializers_in_const_classes` rule (previously `warning`) to keep shared rule settings consistent across supported SDKs.
- Disabled the `unnecessary_await_in_return` rule (previously `error`) to keep shared rule settings consistent across supported SDKs.
- Disabled `iterable_contains_unrelated_type` and `list_remove_unrelated_type` to avoid duplicate diagnostics. Their replacement, `collection_methods_unrelated_type`, remains enabled with `error` severity.

## [312.0.0] - 2026-05-24

### Added
- Enabled the `simple_directive_paths` rule with `warning` severity.

### Changed
- [BREAKING CHANGE] Updated minimum Dart SDK version to `>=3.12.0`.

## [311.0.0] - 2026-02-13

### Added
- Enabled the `simplify_variable_pattern` rule with `warning` severity.

### Changed
- [BREAKING CHANGE] Updated minimum Dart SDK version to `>=3.11.0`.
- Marked the `avoid_null_checks_in_equality_operators` rule as deprecated in Dart 3.11.
- Marked the `prefer_final_parameters` rule as deprecated in Dart 3.11.
- Marked the `use_if_null_to_convert_nulls_to_bools` rule as deprecated in Dart 3.11.

## [310.0.0] - 2025-11-29

### Added
- Enabled the `switch_on_type` rule with `error` severity.
- Enabled the `unnecessary_ignore` rule with `warning` severity.
- Enabled the `unnecessary_unawaited` rule with `warning` severity.
- Enabled the `use_null_aware_elements` rule with `warning` severity.

### Removed
- The `enable_null_safety` rule (removed in Dart 3.0).

## [309.0.0] - 2025-11-29

### Added
- Enabled the `switch_on_type` rule with `error` severity.
- Enabled the `unnecessary_ignore` rule with `warning` severity.
- Enabled the `unnecessary_unawaited` rule with `warning` severity.
- Enabled the `use_null_aware_elements` rule with `warning` severity.

### Removed
- The `enable_null_safety` rule (removed in Dart 3.0).

## [308.0.0] - 2025-11-29

### Added
- Enabled the `unnecessary_ignore` rule with `warning` severity.
- Enabled the `use_null_aware_elements` rule with `warning` severity.

### Removed
- The `enable_null_safety` rule (removed in Dart 3.0).

## [307.0.0] - 2025-11-29

### Removed
- The `enable_null_safety` rule (removed in Dart 3.0).
- The `unsafe_html` rule (removed in Dart 3.7).

## [306.0.0] - 2025-11-29

### Removed
- The `enable_null_safety` rule (removed in Dart 3.0).

## [305.0.0] - 2025-11-29

### Added
- Enabled the `annotate_redeclares` rule with `warning` severity.

### Removed
- The `enable_null_safety` rule (removed in Dart 3.0).

## [304.0.0] - 2025-11-29

### Added
- Enabled the `annotate_redeclares` rule with `warning` severity.

### Removed
- The `enable_null_safety` rule (removed in Dart 3.0).

## [303.0.0] - 2025-11-29

### Added
- Enabled the `annotate_redeclares` rule with `warning` severity.

### Removed
- The `enable_null_safety` rule (removed in Dart 3.0).

## [302.0.0] - 2025-11-29

### Added
- Enabled the `annotate_redeclares` rule with `warning` severity.
- Enabled the `iterable_contains_unrelated_type` rule with `error` severity.
- Enabled the `list_remove_unrelated_type` rule with `error` severity.

### Removed
- The `enable_null_safety` rule (removed in Dart 3.0).

## [301.0.0] - 2025-11-29

### Added
- Enabled the `iterable_contains_unrelated_type` rule with `error` severity.
- Enabled the `list_remove_unrelated_type` rule with `error` severity.

### Removed
- The `enable_null_safety` rule (removed in Dart 3.0).

## [300.0.0] - 2025-11-29

### Changed
- [BREAKING CHANGE] Updated versioning system from `3x.x.x` to `3xy.x.x` format for unambiguous Dart SDK version mapping.

### Removed
- The `enable_null_safety` rule (removed in Dart 3.0).

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