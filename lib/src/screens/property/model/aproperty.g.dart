// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aproperty.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AProperty _$$_APropertyFromJson(Map<String, dynamic> json) => _$_AProperty(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String?,
      tag: json['tag'] as String?,
      type: json['type'] as String?,
      supplier: json['supplier'] as String?,
      brand: json['brand'] as String?,
      serial: json['serial'] as String?,
      location: json['location'] as String?,
      cost: json['cost'] as int? ?? 0,
      warranty: json['warranty'] as int? ?? 0,
      status: json['status'] as int?,
      description: json['description'] as String?,
      createDay: json['createDay'] == null
          ? null
          : DateTime.parse(json['createDay'] as String),
      updateDay: json['updateDay'] == null
          ? null
          : DateTime.parse(json['updateDay'] as String),
      purchaseDay: json['purchaseDay'] == null
          ? null
          : DateTime.parse(json['purchaseDay'] as String),
      image: json['image'] as String?,
      isCheckOut: json['isCheckOut'] as bool? ?? false,
      error: json['error'] as bool? ?? false,
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$$_APropertyToJson(_$_AProperty instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tag': instance.tag,
      'type': instance.type,
      'supplier': instance.supplier,
      'brand': instance.brand,
      'serial': instance.serial,
      'location': instance.location,
      'cost': instance.cost,
      'warranty': instance.warranty,
      'status': instance.status,
      'description': instance.description,
      'createDay': instance.createDay?.toIso8601String(),
      'updateDay': instance.updateDay?.toIso8601String(),
      'purchaseDay': instance.purchaseDay?.toIso8601String(),
      'image': instance.image,
      'isCheckOut': instance.isCheckOut,
      'error': instance.error,
      'message': instance.message,
    };
