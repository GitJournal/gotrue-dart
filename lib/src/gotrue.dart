import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

class GoTrue {
  final String apiUrl;

  GoTrue(this.apiUrl) {
    // FIXME: Abort if using http and prod
  }

  Future<GoTrueSettings> settings() async {
    var response = await Dio(BaseOptions(baseUrl: apiUrl)).get('/settings');
    return GoTrueSettings.fromJson(response.data);
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

class User {}
