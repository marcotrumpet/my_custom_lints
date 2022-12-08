# my_custom_lint

Testing project from [this video](https://www.youtube.com/watch?v=Okg1Os-gtbo) from [Invertase](https://invertase.io).

To use it just add to you pubspec.yaml file

```yaml
dev_dependencies:
  custom_lint: ^0.0.15
  my_custom_lints:
    path: ../my_custom_lints
```

and in your analysis_options.yaml file

```yaml
analyzer:
  plugins:
    - custom_lint
```