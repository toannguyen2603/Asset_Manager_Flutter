import 'package:asset_manager_flutter/env.dart';
import 'package:asset_manager_flutter/src/screens/maintenance/controller/maintenance_controller.dart';
import 'package:asset_manager_flutter/src/screens/maintenance/service/maintenance_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/state/data_state.dart';

final dioProvider = Provider<Dio>((ref) => Dio(
      BaseOptions(baseUrl: config.baseUrl),
    ));

final maintenanceServiceProvider = Provider<MaintenanceService>(
  (ref) => MaintenanceService(ref.read(dioProvider)),
);

final maintenanceNotify = StateNotifierProvider<MaintenanceController, DataState>(
  (ref) => MaintenanceController(ref.read(maintenanceServiceProvider)),
);
