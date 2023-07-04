import 'package:asset_manager_flutter/env.dart';
import 'package:asset_manager_flutter/src/screens/edit/controller/edit_controller.dart';
import 'package:asset_manager_flutter/src/screens/edit/service/edit_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/state/data_state.dart';
import '../service/uploading_image_service.dart';

final dioProvider = Provider<Dio>((ref) => Dio(
      BaseOptions(baseUrl: config.baseUrl),
    ));

final propertyServiceProvider = Provider<EditService>(
  (ref) => EditService(ref.read(dioProvider)),
);

final editNotifier = StateNotifierProvider<EditController, DataState>(
  (ref) => EditController(ref.read(propertyServiceProvider)),
);

final uploadImageServiceProvider = Provider<UploadImageService>(
  (ref) => UploadImageService(ref.read(dioProvider)),
);

