# my_custom_lint

This package will check the class name of files ending with the following values {{#arrayValues}}`{{valueName}}`,{{/arrayValues}}.

Testing project from [this video](https://www.youtube.com/watch?v=Okg1Os-gtbo) from [Invertase](https://invertase.io).

The only difference is that instead of checking `_service` only, it tries to match every class name with the corresponding file name.

e.g.

[some_bloc](my_dart_app/some_bloc.dart) file should give you a warning `If the file name ends with _bloc the className must end with Bloc
Replace Some with SomeBloc`<br>
and<br>
[some_service](my_dart_app/some_service.dart) file should give you a warning `If the file name ends with _service the className must end with Service
Replace Some with SomeService`<br>


To use it just add it to your pubspec.yaml file

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