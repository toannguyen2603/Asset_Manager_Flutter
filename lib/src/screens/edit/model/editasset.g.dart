// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editasset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EditAsset _$$_EditAssetFromJson(Map<String, dynamic> json) => _$_EditAsset(
      name: json['name'] as String? ?? '',
      typeId: json['typeId'] as int?,
      supplierID: json['supplierID'] as int?,
      locationID: json['locationID'] as int?,
      brandID: json['brandID'] as int?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$$_EditAssetToJson(_$_EditAsset instance) =>
    <String, dynamic>{
      'name': instance.name,
      'typeId': instance.typeId,
      'supplierID': instance.supplierID,
      'locationID': instance.locationID,
      'brandID': instance.brandID,
      'status': instance.status,
    };
