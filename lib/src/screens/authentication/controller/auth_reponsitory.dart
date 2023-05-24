import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/state/data_state.dart';
import '../service/auth_service.dart';
import 'auth_controller.dart';

const String baseUrl = 'https://localhost:7150';

final isSignedInProvider = Provider<Dio>((ref) => Dio(
  BaseOptions(baseUrl: baseUrl),
));

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(ref.read(isSignedInProvider)),
);

final authNotifier = StateNotifierProvider<AuthController, DataState>(
  (ref) => AuthController(ref.read(authServiceProvider)),
);
