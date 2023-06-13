import 'package:asset_manager_flutter/src/screens/asset/model/aproperty.dart';
import 'package:dio/dio.dart';

import '../../../constaints/type_defs/type_defs.dart';
// import '../../../utils/session_manager.dart';

class PropertyService {
  final Dio _dio;

  UserId? userId;

  PropertyService(this._dio);

  // SessionManager prefs = SessionManager();

  Future<AProperty> getProperty(String tag) async {
    // await prefs.getUserId().then((value) => userId = value);
    try {
      final response = await _dio.get(
        '/api/Mobile/GetAsset/${userId}/${tag}',
      );
      if (response.statusCode == 200) {
        final data = AProperty.fromJson(response.data);
        return data;
      } else {
        throw Exception('An error occurred');
      }
    } on DioException catch (e) {
      throw Exception(e.response!.data['error_description']);
    } catch (e) {
      print('_errorMsg $e');
      throw Exception("Couldn't login. Is the device online?");
    }
  }
}

class PropertyScanner {
  final dio = Dio();
  UserId? userId;
  // SessionManager prefs = SessionManager();

  Future<AProperty> getProperty(String tag) async {
    // await prefs.getUserId().then((value) => userId = value);
    try {
      final response = await dio.get(
        'https://masset-api.nhp-tech.com/api/Mobile/GetAsset/${userId}/${tag}',
      );
      if (response.statusCode == 200) {
        final data = AProperty.fromJson(response.data);
        return data;
      } else {
        throw Exception('An error occurred');
      }
    } on DioException catch (e) {
      throw Exception(e.response!.data['error_description']);
    } catch (e) {
      print('_errorMsg $e');
      throw Exception("Couldn't login. Is the device online?");
    }
  }
}
