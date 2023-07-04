// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lmaintenance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LMaintenance _$$_LMaintenanceFromJson(Map<String, dynamic> json) =>
    _$_LMaintenance(
      id: json['id'] as int? ?? 0,
      asset: json['asset'] as String?,
      message: json['message'] as String?,
      supplier: json['supplier'] as String?,
      type: json['type'] ?? 0,
      error: json['error'] ?? bool,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$$_LMaintenanceToJson(_$_LMaintenance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'asset': instance.asset,
      'message': instance.message,
      'supplier': instance.supplier,
      'type': instance.type,
      'error': instance.error,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
    };
