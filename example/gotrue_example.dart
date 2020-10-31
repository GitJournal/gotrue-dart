import 'package:gotrue/gotrue.dart';

import 'package:args/command_runner.dart';
import 'package:gotrue/src/gotrue.dart';

Future<void> main(List<String> args) async {
  var runner = CommandRunner('gotrue', 'GoTrue Client')
    ..addCommand(SettingsCommand());

  try {
    await runner.run(args);
  } on Exception catch (e) {
    print(e);
  }
}

class SettingsCommand extends Command {
  @override
  final name = 'settings';

  @override
  final description = 'Print the settings';

  @override
  Future run() async {
    var goTrue = GoTrue('http://localhost:9999');
    var s = await goTrue.settings();
    print(s);
  }
}
