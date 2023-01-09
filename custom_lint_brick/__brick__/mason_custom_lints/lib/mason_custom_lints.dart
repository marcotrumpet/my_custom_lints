import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

{{#arrayValues}}
import 'package:mason_custom_lints/src/name_checkers/{{valueName}}_name_checker.dart';
{{/arrayValues}}


PluginBase createPlugin() => _MasonCustomLints();

class _MasonCustomLints extends PluginBase {
  @override
  Stream<Lint> getLints(ResolvedUnitResult resolvedUnitResult) async* {
    final library = resolvedUnitResult.libraryElement;

    final classes = library.topLevelElements.whereType<ClassElement>().toList();

    for (final classInstance in classes) {
      {{#arrayValues}}
      yield* {{valueName}}ShouldMatchFileName(unit: resolvedUnitResult, classInstance: classInstance,);
      {{/arrayValues}}
    }
  }
}
