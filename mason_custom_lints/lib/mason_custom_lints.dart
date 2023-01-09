import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import 'package:mason_custom_lints/src/name_checkers/bloc_name_checker.dart';

PluginBase createPlugin() => _MasonCustomLints();

class _MasonCustomLints extends PluginBase {
  @override
  Stream<Lint> getLints(ResolvedUnitResult resolvedUnitResult) async* {
    final library = resolvedUnitResult.libraryElement;

    final classes = library.topLevelElements.whereType<ClassElement>().toList();

    for (final classInstance in classes) {
      yield* blocShouldMatchFileName(
        unit: resolvedUnitResult,
        classInstance: classInstance,
      );
    }
  }
}
