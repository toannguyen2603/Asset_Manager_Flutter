import 'package:asset_manager_flutter/src/constaints/role.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/state/data_state.dart';
import '../service/auth_service.dart';

class AuthController extends StateNotifier<DataState> {
  AuthController(this._authService) : super(const DataState.initial());

  final AuthService _authService;

  Future<void> login(Map<String, dynamic> credentials) async {
    state = const DataState.loading();
    try {
      final user = await _authService.login(
        credentials['username'],
        credentials['password'],
      );
      if (user.message.isEmpty && user.role == Role.staff) {
        state = DataState.success(data: user);
      } else {
        state = const DataState.error(
            message: 'Username or password is incorrect. Please try again');
      }
    } catch (e) {
      state = DataState.error(message: e.toString());
    }
  }
}
