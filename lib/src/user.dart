import 'package:meta/meta.dart';

/*
$ curl 'http://localhost:9999/user' -H 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhcHAuZ2l0am91cm5hbC5pbyIsImV4cCI6MTYwNDE4MDEyMywic3ViIjoiMzU5MzFhYzktMWEyMC00ZmY2LWJhMmYtNmU2YTA0M2VlOTFkIiwiZW1haWwiOiJoYW5kYS52aXNoQGdtYWlsLmNvbSIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIn0sInVzZXJfbWV0YWRhdGEiOnt9fQ.z38qNESq4Hm_wmLhuH1POmZVI0ufe0g3XGxIRXy83aQ'
{"id":"35931ac9-1a20-4ff6-ba2f-6e6a043ee91d","aud":"app.gitjournal.io","role":"","email":"handa.vish@gmail.com","confirmed_at":"2020-10-31T18:16:22.756442+01:00","confirmation_sent_at":"2020-10-31T18:13:39.852361+01:00","app_metadata":{"provider":"email"},"user_metadata":{},"created_at":"2020-10-31T18:13:39.85121+01:00","updated_at":"2020-10-31T18:13:39.851215+01:00"}%
*/

class User {
  final String id;
  final String aud;
  final String role;
  final String email;

  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime confirmedAt;
  final DateTime confirmationSentAt;

  final Map<String, dynamic> userMetadata;
  final Map<String, dynamic> appMetadata;

  User({
    @required this.id,
    @required this.aud,
    @required this.role,
    @required this.email,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.confirmedAt,
    @required this.confirmationSentAt,
    @required this.userMetadata,
    @required this.appMetadata,
  });

  static User fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      aud: map['aud'],
      role: map['role'],
      email: map['email'],
      createdAt: _parse(map['created_at']),
      updatedAt: _parse(map['updated_at']),
      confirmedAt: _parse(map['confirmed_at']),
      confirmationSentAt: _parse(map['confirmation_sent_at']),
      userMetadata: map['user_metadata'],
      appMetadata: map['app_metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'aud': aud,
      'role': role,
      'email': email,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'confirmed_at': confirmedAt?.toIso8601String(),
      'confirmation_sent_at': confirmationSentAt?.toIso8601String(),
      'user_metadata': userMetadata,
      'app_metadata': appMetadata,
    };
  }

  @override
  String toString() => toJson().toString();
}

DateTime _parse(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  return DateTime.parse(input);
}
