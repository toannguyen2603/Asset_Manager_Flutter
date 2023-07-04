// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lsupplier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LSupplier _$$_LSupplierFromJson(Map<String, dynamic> json) => _$_LSupplier(
      id: (json['id'] as List<dynamic>?)?.map((e) => e as int).toList(),
      name: (json['name'] as List<dynamic>?)?.map((e) => e as String).toList(),
      error: json['error'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_LSupplierToJson(_$_LSupplier instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'error': instance.error,
      'message': instance.message,
    };
