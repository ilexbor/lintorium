### analysis_options.yaml

```yaml
include: package:lintorium/analysis_options.yaml

analyzer:
  exclude:
    - "**/generated/**" # Excludes all files in the "generated" directory and its subdirectories
    - "**/*.freezed.dart" # Excludes all files ending with ".freezed.dart"
    - "**/*.g.dart" # Excludes all files ending with ".g.dart"
    - "**/*.gen.dart" # Excludes all files ending with ".gen.dart"
```