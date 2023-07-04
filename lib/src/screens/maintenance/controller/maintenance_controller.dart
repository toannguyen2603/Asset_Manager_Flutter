import 'package:asset_manager_flutter/src/screens/maintenance/service/maintenance_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/state/data_state.dart';

class MaintenanceController extends StateNotifier<DataState> {
  MaintenanceController(this._maintenanceService)
      : super(const DataState.initial());

  final MaintenanceService _maintenanceService;

  Future<void> createMaintenance(Map<String, dynamic> credentials) async {
    state = const DataState.loading();
    try {
      final createMaintenance = await _maintenanceService.createMaintenance(
        credentials['assetID'],
        credentials['supplierID'],
        credentials['type'],
        credentials['startDate'],
        credentials['endDate'],
      );

      if (!createMaintenance.error) {
        state = DataState.success(data: createMaintenance);
      } else {
        state = const DataState.error(message: 'Something wrong');
      }
    } catch (e) {
      state = DataState.error(message: e.toString());
    }
  }
}
