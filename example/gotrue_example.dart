import 'package:gotrue/gotrue.dart';

import 'package:args/command_runner.dart';

var baseUrl = 'http://localhost:9999';

Future<void> main(List<String> args) async {
  var runner = CommandRunner('gotrue', 'GoTrue Client')
    ..addCommand(SettingsCommand())
    ..addCommand(UserCommand())
    ..addCommand(LoginCommand());

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
    var goTrue = GoTrue(baseUrl);
    var s = await goTrue.settings();
    print(s);
  }
}

class LoginCommand extends Command {
  @override
  final name = 'login';

  @override
  final description = 'Login';

  @override
  Future run() async {
    var goTrue = GoTrue(baseUrl);
    var token = await goTrue.login('handa.vish@gmail.com', 'blah');
    print(token);
  }
}

class UserCommand extends Command {
  @override
  final name = 'user';

  @override
  final description = 'user';

  @override
  Future run() async {
    var goTrue = GoTrue(baseUrl);
    var user = await goTrue.user(
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhcHAuZ2l0am91cm5hbC5pbyIsImV4cCI6MTYwNDE4MTYxMiwic3ViIjoiMzU5MzFhYzktMWEyMC00ZmY2LWJhMmYtNmU2YTA0M2VlOTFkIiwiZW1haWwiOiJoYW5kYS52aXNoQGdtYWlsLmNvbSIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIn0sInVzZXJfbWV0YWRhdGEiOnt9fQ.TTKoFfNFHmb41qoCEeHHc3LygMIxw2C5XxwqYol0uCA');
    print(user);
  }
}
