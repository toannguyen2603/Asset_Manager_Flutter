import 'package:asset_manager_flutter/src/constaints/type_defs/type_defs.dart';
import 'package:asset_manager_flutter/src/screens/property/service/property_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/state/data_state.dart';

class PropertyController extends StateNotifier<DataState> {
  PropertyController(
    this._propertyService,
  ) : super(const DataState.initial());

  final PropertyService _propertyService;

  Future<void> getProperty(Tag tag) async {
    state = const DataState.loading();
    try {
      final property = await _propertyService.getProperty(tag);
      if (property.error == true) {
        state = DataState.error(message: property.message);
      }
      state = DataState.success(data: property);
    } catch (e) {
      state = DataState.error(message: e.toString());
    }
  }
}
