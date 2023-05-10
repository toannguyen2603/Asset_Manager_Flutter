import 'package:asset_manager_flutter/src/widgets/state/data_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/authentication/controller/auth_controller.dart';
import '../screens/authentication/controller/auth_reponsitory.dart';
import '../screens/authentication/service/auth_service.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

class DomainManager {
  static DomainManager? _instance;

  DomainManager._();

  static DomainManager get instance => _instance ??= DomainManager._();

  final authServiceProvider =
      Provider<AuthService>((ref) => AuthService(ref.read(dioProvider)));
}

final authNotifier = StateNotifierProvider<AuthController, DataState>(
    (ref) => AuthController(ref.read(authServiceProvider)));
