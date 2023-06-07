import 'package:asset_manager_flutter/env.dart';
import 'package:dio/dio.dart';

import '../model/auth_user.dart';

class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  Future<LAuthUser> login(String username, String password) async {
    try {
      final response = await _dio.post(
        config.login,
        data: <String, dynamic>{
          'userName': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return LAuthUser.fromJson(response.data);
      } else {
        throw Exception('An error occurred');
      }
    } on DioException catch (e) {
      throw Exception(e.response!.data['error_description']);
    } catch (e) {
      throw Exception("Couldn't login. Is the device online?");
    }
  }
}
