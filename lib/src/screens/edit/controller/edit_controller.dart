import 'package:asset_manager_flutter/src/screens/edit/service/edit_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/state/data_state.dart';

class EditController extends StateNotifier<DataState> {
  EditController(this._editService) : super(const DataState.initial());

  final EditService _editService;

  Future<void> editProperty(Map<String, dynamic> credentials) async {
    state = const DataState.loading();
    print('have running');
    try {
      final editProperty = await _editService.editProperty(
        credentials['tag'],
        credentials['status'],
        credentials['description'],
      );

      print('Error: ${editProperty.error}');
      if (!editProperty.error) {
        state = DataState.success(data: editProperty);
      } else {
        state = const DataState.error(message: 'Edit failure');
      }
    } catch (e) {
      state = DataState.error(message: e.toString());
    }
  }
}
