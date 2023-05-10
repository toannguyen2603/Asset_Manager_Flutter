import 'package:dio/dio.dart';

import '../model/auth_user.dart';

class AuthService {
  
  final Dio _dio;

  AuthService(this._dio);

  Future<LAuthUser> login(String username, String password) async {
    try {
      final response = await _dio.post(
        'api/Mobile/Login',
        data: <String, dynamic>{'userName': username, 'password': password},
      );

      if (response.statusCode == 200) {
        return LAuthUser.fromJson(response.data['user']);
      } else {
        throw Exception('An error occurred');
      }
    } on DioError catch (e) {
      throw Exception(e.response!.data['error_description']);
    } catch (e) {
      throw Exception("Couldn't login. Is the device online?");
    }
  }
}