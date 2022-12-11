import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/source/source_range.dart';
import 'package:analyzer_plugin/protocol/protocol_generated.dart';
import 'package:analyzer_plugin/utilities/change_builder/change_builder_core.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import 'extensions.dart';

Stream<Lint> serviceShouldMatchFileName({
  required ResolvedUnitResult unit,
  required ClassElement classInstance,
}) async* {
  final library = unit.libraryElement;
  final filePath = library.source.fullName;
  final fileName = library.source.shortName;

  final className = classInstance.name;
  final location = classInstance.nameLintLocation;

  bool fileNameEndsWithValueName() =>
      fileName.replaceAll('.dart', '').split('_').last == 'service';

  String valueNameCapitalized() => 'service'.capitalize();

  final newClassName = '$className${valueNameCapitalized()}';

  if (fileNameEndsWithValueName() &&
      !className.endsWith(valueNameCapitalized())) {
    yield Lint(
      code: 'class_name_should_match_file_name',
      message:
          'If the file name ends with _service the className must end with ${valueNameCapitalized()}',
      location: unit.lintLocationFromLines(
        startLine: location?.startLine ?? 1,
        endLine: location?.endLine ?? 1,
        startColumn: location?.startColumn ?? 1,
        endColumn: location?.endColumn ?? 1,
      ),
      correction: 'Replace $className with $newClassName',
      severity: LintSeverity.warning,
      getAnalysisErrorFixes: (Lint lint) async* {
        final changeBuilder = ChangeBuilder(session: unit.session);

        await changeBuilder.addDartFileEdit(
          filePath,
          (fileEditBuilder) {
            fileEditBuilder.addReplacement(
                SourceRange(location!.offset, location.length), (builder) {
              builder.write(newClassName);
            });
          },
        );

        yield AnalysisErrorFixes(
          lint.asAnalysisError(),
          fixes: [
            PrioritizedSourceChange(
                0,
                changeBuilder.sourceChange
                  ..message = 'Replace with $newClassName'),
          ],
        );
      },
    );
  }
}
