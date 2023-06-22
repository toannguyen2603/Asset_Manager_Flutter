import 'package:asset_manager_flutter/env.dart';
import 'package:asset_manager_flutter/src/screens/property/model/aproperty.dart';
import 'package:asset_manager_flutter/src/screens/property/service/property_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) => Dio(
  BaseOptions(baseUrl: config.baseUrl),
));

final propertyServiceProvider = Provider<PropertyService>(
  (ref) => PropertyService(ref.read(dioProvider)),
);

final propertyProvider = FutureProvider.family<AProperty, String>((ref, tag) {
  final courseRepository = ref.read(propertyServiceProvider);
  return courseRepository.getProperty(tag);
});

