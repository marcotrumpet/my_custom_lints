import 'dart:isolate';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import '../src/name_checkers/service_name_checker.dart';

import '../src/name_checkers/bloc_name_checker.dart';

void main(List<String> args, SendPort sendPort) {
  startPlugin(sendPort, _MasonCustomLints());
}

class _MasonCustomLints extends PluginBase {
  @override
  Stream<Lint> getLints(ResolvedUnitResult unit) async* {
    final library = unit.libraryElement;

    final classes = library.topLevelElements.whereType<ClassElement>().toList();

    for (final classInstance in classes) {
      yield* serviceShouldMatchFileName(
        unit: unit,
        classInstance: classInstance,
      );

      yield* blocShouldMatchFileName(
        unit: unit,
        classInstance: classInstance,
      );
    }
  }
}
