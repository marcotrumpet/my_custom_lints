# mason_custom_lint

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

This project contains uses a brick template to generate custom lints with mason.

Generated code is built on top of [custom_lint](https://pub.dev/packages/custom_lint#creating-a-custom-lint-package).

## Generate

Take a look on how to [initialize mason](https://github.com/felangel/mason) and than you can do `mason make custom_lint_brick` into terminal.

CLI will ask you what kind of file name and corresponding classes you want to match. 

E.g. if you have a file called `authentication_service.dart` and you want to have inside it a class called `AuthenticationService` and not only `Authentication` you can write `service` when CLI will ask you.

The same with `bloc`, `model` and so on.

## Usage

Mason will generate a flutter package based on `custom_lint` package so the only thing you need to do in order to use it in your project is to add it to pubpsec and change the analysis_options file.