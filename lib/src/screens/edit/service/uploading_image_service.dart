import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:asset_manager_flutter/env.dart';

import '../../../constaints/type_defs/type_defs.dart';
import '../../../utils/session_manager.dart';

class UploadImageService {
  final Dio _dio;

  UploadImageService(this._dio);
  UserId? userId;

  SessionManager prefs = SessionManager();

  Future<String> uploadingImage(Tag tag, File file) async {
    await prefs.getUserId().then((value) => userId = value);

    try {
      String fileName = file.path.split('/').last;
      Map<String, dynamic> data = {
        'image': await MultipartFile.fromFile(file.path, filename: fileName),
      };
      FormData formData = FormData.fromMap(data);

      final response = await _dio.put(
        config.uploadImage(userId ?? '', tag),
        data: formData,
      );
      _dio.options.headers['content-Type'] = 'multipart/form-data';

      if (response.statusCode == 200) {
        return 'Upload image success';
      } else {
        print('upload failure');

        throw Exception('An error occurred');
      }
    } on DioException catch (e) {
      throw Exception(e.response!.data['error_description']);
    } catch (e) {
      throw Exception("Couldn't login. Is the device online?");
    }
  }
}
