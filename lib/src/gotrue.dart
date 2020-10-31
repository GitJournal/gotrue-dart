import 'package:dio/dio.dart';

import 'package:gotrue/gotrue.dart';
import 'package:gotrue/src/settings.dart';
import 'package:gotrue/src/token.dart';

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

  Future<String> loginExternalProvider(String provider) async {
    var response =
        await _dio().get('/authorize', queryParameters: {'provider': provider});

    return response.data;
  }

  Future<Token> refresh(String refreshToken) async {
    var formData = FormData.fromMap({
      'refresh_token': refreshToken,
      'grant_type': 'refresh_token',
    });
    var response = await _dio().post('/token', data: formData);
    return Token.fromJson(response.data);
  }

  Future<User> signup(String email, String password) async {
    var response = await _dio().post('/signup', data: {
      'email': 'email',
      'password': password,
    });
    return User.fromJson(response.data);
  }

  Future<Token> confirmSignup(String token) async {
    var response = await _dio().post('/verify', data: {
      'type': 'signup',
      'token': token,
    });
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
