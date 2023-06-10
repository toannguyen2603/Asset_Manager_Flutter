import 'package:asset_manager_flutter/env.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/state/data_state.dart';
import '../service/auth_service.dart';
import 'auth_controller.dart';

final isSignedInProvider = Provider<Dio>((ref) => Dio(
      BaseOptions(baseUrl: config.baseUrl),
    ));

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(ref.read(isSignedInProvider)),
);

final authNotifier = StateNotifierProvider<AuthController, DataState>(
  (ref) => AuthController(ref.read(authServiceProvider)),
);
