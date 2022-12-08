import 'dart:isolate';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../src/class_name_checker.dart';

void main(List<String> args, SendPort sendPort) {
  startPlugin(sendPort, _MyCustomLints());
}

class _MyCustomLints extends PluginBase {
  @override
  Stream<Lint> getLints(ResolvedUnitResult unit) async* {
    final library = unit.libraryElement;

    final classes = library.topLevelElements.whereType<ClassElement>().toList();

    for (final classInstance in classes) {
      yield* classNameShouldMatchFileName(unit, classInstance);
    }
  }
}
