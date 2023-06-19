import 'package:asset_manager_flutter/env.dart';
import 'package:dio/dio.dart';

import '../../../utils/session_manager.dart';
import '../model/auth_user.dart';

class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  SessionManager session = SessionManager();

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
        var data = LAuthUser.fromJson(response.data);
        if (!data.error) {
          session.setUserId(data.id ?? '');
          session.setInfoUser(data);
        } else {
          throw Exception('An error occurred');
        }
        return data;
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
