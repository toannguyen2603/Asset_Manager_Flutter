import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../model/auth_user.dart';

class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  Future<LAuthUser> login(String userName, String password) async {
    try {
      (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (HttpClient dioClient) {
        dioClient.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
        return dioClient;
      };
      final response = await _dio.post(
        '/api/Mobile/Login',
        data: <String, dynamic>{
          "userName": userName,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        return LAuthUser.fromJson(response.data);
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
