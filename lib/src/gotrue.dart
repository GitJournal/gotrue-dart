import 'package:gotrue/gotrue.dart';
import 'package:gotrue/src/settings.dart';
import 'package:gotrue/src/token.dart';
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
