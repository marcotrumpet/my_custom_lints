import 'package:mason/mason.dart';

void run(HookContext context) {
  final properties = <Map<String, dynamic>>[];
  final logger = context.logger;

  logger.info(lightYellow.wrap(
      'Insert the end of file name you want your class matches e.g. `service`, `bloc`, `model`'));
  logger.info(lightYellow.wrap('Enter `e` to exit adding values'));

  while (true) {
    final value =
        context.logger.prompt(': ').replaceAll(RegExp('\\s+'), ' ').trim();

    if (value.toLowerCase() == 'e') {
      break;
    }

    if (value.isEmpty) {
      logger.alert('Pleas write a value or type `e` to exit');
      continue;
    }
    properties.add({'valueName': value});
  }

  context.vars['arrayValues'] = properties;
}
