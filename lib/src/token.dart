import 'package:meta/meta.dart';

class Token {
  final String refreshToken;
  final String accessToken;
  final String tokenType;
  final DateTime expiresAt;

  Token({
    @required this.refreshToken,
    @required this.accessToken,
    @required this.tokenType,
    @required this.expiresAt,
  });

  static Token fromJson(Map<String, dynamic> map) {
    var seconds = map['expires_in'] as int;

    return Token(
      accessToken: map['access_token'],
      refreshToken: map['refreshToken'],
      tokenType: map['token_type'],
      expiresAt: DateTime.now().add(Duration(seconds: seconds)),
    );
  }

  Map<String, dynamic> toJson() {
    var expires = expiresAt.millisecondsSinceEpoch ~/ 1000;
    var now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'token_type': tokenType,
      'expires_in': expires - now,
    };
  }

  @override
  String toString() => toJson().toString();
}

// TODO: Access token can be parsed!!

/*
{"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhcHAuZ2l0am91cm5hbC5pbyIsImV4cCI6MTYwNDE2ODE4Miwic3ViIjoiMzU5MzFhYzktMWEyMC00ZmY2LWJhMmYtNmU2YTA0M2VlOTFkIiwiZW1haWwiOiJoYW5kYS52aXNoQGdtYWlsLmNvbSIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIn0sInVzZXJfbWV0YWRhdGEiOnt9fQ.EbfQO7JlX0at2OTHOYABUDP6m2tC41Ts03lg6s9zQt4",
"token_type":"bearer","expires_in":3600,"refresh_token":"RB7wNCeHeGu3QZiJ4IiRTQ"}
*/
