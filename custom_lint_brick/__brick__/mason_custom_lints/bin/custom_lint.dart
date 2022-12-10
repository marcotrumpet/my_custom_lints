import 'dart:isolate';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

{{#arrayValues}}
import '../src/{{valueName}}_name_checker.dart';
{{/arrayValues}}

void main(List<String> args, SendPort sendPort) {
  startPlugin(sendPort, _MasonCustomLints());
}

class _MasonCustomLints extends PluginBase {
  @override
  Stream<Lint> getLints(ResolvedUnitResult unit) async* {
    final library = unit.libraryElement;

    final classes = library.topLevelElements.whereType<ClassElement>().toList();

    for (final classInstance in classes) {
      {{#arrayValues}}
      yield* {{valueName}}ShouldMatchFileName(unit: unit, classInstance: classInstance,);
      {{/arrayValues}}
    }
  }
}
