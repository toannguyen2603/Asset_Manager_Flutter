import 'package:asset_manager_flutter/env.dart';
import 'package:asset_manager_flutter/src/screens/edit/model/leditproperty.dart';
import 'package:dio/dio.dart';

import '../../../constaints/type_defs/type_defs.dart';
import '../../../utils/session_manager.dart';

class EditService {
  final Dio _dio;

  EditService(this._dio);
  UserId? userId;

  SessionManager prefs = SessionManager();

  Future<LEditProperty> login(Tag tag, int status, String description) async {
    await prefs.getUserId().then((value) => userId = value);

    try {
      final response = await _dio.put(
        config.editProperty(userId ?? '', tag),
        data: <String, dynamic>{
          'status': status,
          'description': description,
        },
      );
      if (response.statusCode == 200) {
        var data = LEditProperty.fromJson(response.data);
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
