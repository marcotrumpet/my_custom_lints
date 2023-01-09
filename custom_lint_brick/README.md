# custom_lint_brick

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

This project uses a brick template to generate custom lints with mason.

![bloc_demo](https://raw.githubusercontent.com/marcotrumpet/my_custom_lints/master/assets/bloc_demo.gif)

Generated code is built on top of [custom_lint][5].

## Getting Started 🚀

This is a starting point for a new brick.
A few resources to get you started if this is your first brick template:

- [Official Mason Documentation][2]
- [Code generation with Mason Blog][3]
- [Very Good Livestream: Felix Angelov Demos Mason][4]

[1]: https://github.com/felangel/mason
[2]: https://github.com/felangel/mason/tree/master/packages/mason_cli#readme
[3]: https://verygood.ventures/blog/code-generation-with-mason
[4]: https://youtu.be/G4PTjA6tpTU
[5]: https://pub.dev/packages/custom_lint#creating-a-custom-lint-package

## Generate 💻

Take a look at how to initialize [mason](https://github.com/felangel/mason) and then you can do `mason make custom_lint_brick` into a terminal.

CLI will ask you what kind of file name and corresponding classes you want to match. 

E.g. if you have a file called `authentication_service.dart` and you want to have inside it a class called `AuthenticationService` and not only `Authentication` you can write `service` when CLI will ask you.

The same with `bloc`, `model` and so on.

*mason_custom_lints folder contains a generated package that checks for `_service` and `_bloc` files.*

## Usage 🔨

Mason will generate a flutter package based on `custom_lint` package so the only thing you need to do to use it in your project is to add it to pubpsec and change the analysis_options file.

In your App add this to your pubspec.yaml:
```yaml
dev_dependencies:
  custom_lint: ^0.0.15
  mason_custom_lints:
    path: ../mason_custom_lints
```
And in your analysis_options.yaml add:
```yaml
analyzer:
  plugins:
    - custom_lint
```