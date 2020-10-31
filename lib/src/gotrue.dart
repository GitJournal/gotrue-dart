import 'package:gotrue/gotrue.dart';
import 'package:gotrue/src/token.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

class GoTrue {
  final String apiUrl;

  GoTrue(this.apiUrl) {
    // FIXME: Abort if using http and prod
  }

  Future<GoTrueSettings> settings() async {
    var response = await _dio().get('/settings');
    return GoTrueSettings.fromJson(response.data);
  }

  Future<Token> login(String email, String password) async {
    var formData = FormData.fromMap({
      'username': email,
      'password': password,
      'grant_type': 'password',
    });
    var response = await _dio().post('/token', data: formData);
    return Token.fromJson(response.data);
  }

  Future<User> user(String accessToken) async {
    var response = await _dio().get(
      '/user',
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );
    return User.fromJson(response.data);
  }

  Dio _dio() {
    return Dio(BaseOptions(baseUrl: apiUrl));
  }
}

class GoTrueSettings {
  final GoTrueExternalSettings extern;
  final bool disableSignup;
  final bool autoconfirm;

  GoTrueSettings({
    @required this.extern,
    @required this.disableSignup,
    @required this.autoconfirm,
  });

  static GoTrueSettings fromJson(Map<String, dynamic> map) {
    return GoTrueSettings(
      autoconfirm: map['autoconfirm'],
      disableSignup: map['disable_signup'],
      extern: GoTrueExternalSettings.fromJson(map['external']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'external': extern,
      'autoconfirm': autoconfirm,
      'disable_signup': disableSignup,
    };
  }

  @override
  String toString() => toJson().toString();
}

class GoTrueExternalSettings {
  final bool bitbucket;
  final bool github;
  final bool gitlab;
  final bool google;
  final bool facebook;
  final bool email;
  final bool saml;

  GoTrueExternalSettings({
    @required this.bitbucket,
    @required this.github,
    @required this.gitlab,
    @required this.google,
    @required this.facebook,
    @required this.email,
    @required this.saml,
  });

  static GoTrueExternalSettings fromJson(Map<String, dynamic> map) {
    return GoTrueExternalSettings(
      bitbucket: map['bitbucket'],
      github: map['github'],
      gitlab: map['gitlab'],
      google: map['google'],
      facebook: map['facebook'],
      email: map['email'],
      saml: map['saml'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bitbucket': bitbucket,
      'github': github,
      'gitlab': gitlab,
      'google': google,
      'facebook': facebook,
      'email': email,
      'saml': saml,
    };
  }

  @override
  String toString() => toJson().toString();
}

// API URL
// Audience
// tokenResponse - json
//

//  claims = JSON.parse(urlBase64Decode(tokenResponse.access_token.split('.          ')[1]));
//  this.token.expires_at = claims.exp * 1000;

// jwt
// logout
// update
// refresh
