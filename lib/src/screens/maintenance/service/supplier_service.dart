import 'package:asset_manager_flutter/env.dart';
import 'package:dio/dio.dart';

import '../../../constaints/type_defs/type_defs.dart';
import '../../../utils/session_manager.dart';
import '../../edit/model/lsupplier.dart';

class SupplierService {
  final _dio = Dio();

  UserId? userId;

  SessionManager prefs = SessionManager();

  Future<LSupplier> getSupplier() async {
    await prefs.getUserId().then((value) => userId = value);
    try {
      final response = await _dio.get(
        config.getSupplier(userId ?? ''),
      );
      if (response.statusCode == 200) {
        var data = LSupplier.fromJson(response.data);
        return data;
      } else {
        throw Exception('An error occurred');
      }
    } on DioException catch (e) {
      throw Exception(e.response);
    } catch (e) {
      throw Exception("Couldn't login. Is the device online?");
    }
  }
}
