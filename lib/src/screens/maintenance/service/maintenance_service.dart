import 'package:asset_manager_flutter/env.dart';
import 'package:dio/dio.dart';

import '../../../constaints/type_defs/type_defs.dart';
import '../../../utils/session_manager.dart';
import '../model/lmaintenance.dart';

class MaintenanceService {
  final Dio _dio;

  MaintenanceService(this._dio);
  UserId? userId;

  SessionManager prefs = SessionManager();

  Future<LMaintenance> createMaintenance(
    int assetID,
    int supplierID,
    int type,
    String startDate,
    String endDate,
  ) async {
    await prefs.getUserId().then((value) => userId = value);
    try {
      final response = await _dio.post(
        config.createMaintenance(userId ?? ''),
        data: <String, dynamic>{
          'assetID': assetID,
          'supplierID': supplierID,
          'type': type,
          'startDate': startDate,
          'endDate': endDate,
        },
      );
      if (response.statusCode == 200) {
        var data = LMaintenance.fromJson(response.data);
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
