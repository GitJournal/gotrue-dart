A library for Dart developers.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

## Usage

A simple usage example:

```dart
import 'package:gotrue/gotrue.dart';

main() {
  var awesome = new Awesome();
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme

// Admin
// -> listUsers
// -> getUser
// -> updateUser
// -> createUser
// -> deleteUser

// User

// signup (email, password, data) -> User
// login (email, password) -> User
// loginExternalUrl -> User
// confirm(token) -> User
// requestPasswordRecovery(email)
// recover(token)
