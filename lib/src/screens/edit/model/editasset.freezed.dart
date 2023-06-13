// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editasset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EditAsset _$EditAssetFromJson(Map<String, dynamic> json) {
  return _EditAsset.fromJson(json);
}

/// @nodoc
mixin _$EditAsset {
  String get name => throw _privateConstructorUsedError;
  int? get typeId => throw _privateConstructorUsedError;
  int? get supplierID => throw _privateConstructorUsedError;
  int? get locationID => throw _privateConstructorUsedError;
  int? get brandID => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditAssetCopyWith<EditAsset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditAssetCopyWith<$Res> {
  factory $EditAssetCopyWith(EditAsset value, $Res Function(EditAsset) then) =
      _$EditAssetCopyWithImpl<$Res, EditAsset>;
  @useResult
  $Res call(
      {String name,
      int? typeId,
      int? supplierID,
      int? locationID,
      int? brandID,
      int? status});
}

/// @nodoc
class _$EditAssetCopyWithImpl<$Res, $Val extends EditAsset>
    implements $EditAssetCopyWith<$Res> {
  _$EditAssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? typeId = freezed,
    Object? supplierID = freezed,
    Object? locationID = freezed,
    Object? brandID = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      typeId: freezed == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as int?,
      supplierID: freezed == supplierID
          ? _value.supplierID
          : supplierID // ignore: cast_nullable_to_non_nullable
              as int?,
      locationID: freezed == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as int?,
      brandID: freezed == brandID
          ? _value.brandID
          : brandID // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditAssetCopyWith<$Res> implements $EditAssetCopyWith<$Res> {
  factory _$$_EditAssetCopyWith(
          _$_EditAsset value, $Res Function(_$_EditAsset) then) =
      __$$_EditAssetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int? typeId,
      int? supplierID,
      int? locationID,
      int? brandID,
      int? status});
}

/// @nodoc
class __$$_EditAssetCopyWithImpl<$Res>
    extends _$EditAssetCopyWithImpl<$Res, _$_EditAsset>
    implements _$$_EditAssetCopyWith<$Res> {
  __$$_EditAssetCopyWithImpl(
      _$_EditAsset _value, $Res Function(_$_EditAsset) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? typeId = freezed,
    Object? supplierID = freezed,
    Object? locationID = freezed,
    Object? brandID = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_EditAsset(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      typeId: freezed == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as int?,
      supplierID: freezed == supplierID
          ? _value.supplierID
          : supplierID // ignore: cast_nullable_to_non_nullable
              as int?,
      locationID: freezed == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as int?,
      brandID: freezed == brandID
          ? _value.brandID
          : brandID // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EditAsset implements _EditAsset {
  _$_EditAsset(
      {this.name = '',
      this.typeId,
      this.supplierID,
      this.locationID,
      this.brandID,
      this.status});

  factory _$_EditAsset.fromJson(Map<String, dynamic> json) =>
      _$$_EditAssetFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  final int? typeId;
  @override
  final int? supplierID;
  @override
  final int? locationID;
  @override
  final int? brandID;
  @override
  final int? status;

  @override
  String toString() {
    return 'EditAsset(name: $name, typeId: $typeId, supplierID: $supplierID, locationID: $locationID, brandID: $brandID, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditAsset &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.typeId, typeId) || other.typeId == typeId) &&
            (identical(other.supplierID, supplierID) ||
                other.supplierID == supplierID) &&
            (identical(other.locationID, locationID) ||
                other.locationID == locationID) &&
            (identical(other.brandID, brandID) || other.brandID == brandID) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, typeId, supplierID, locationID, brandID, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditAssetCopyWith<_$_EditAsset> get copyWith =>
      __$$_EditAssetCopyWithImpl<_$_EditAsset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EditAssetToJson(
      this,
    );
  }
}

abstract class _EditAsset implements EditAsset {
  factory _EditAsset(
      {final String name,
      final int? typeId,
      final int? supplierID,
      final int? locationID,
      final int? brandID,
      final int? status}) = _$_EditAsset;

  factory _EditAsset.fromJson(Map<String, dynamic> json) =
      _$_EditAsset.fromJson;

  @override
  String get name;
  @override
  int? get typeId;
  @override
  int? get supplierID;
  @override
  int? get locationID;
  @override
  int? get brandID;
  @override
  int? get status;
  @override
  @JsonKey(ignore: true)
  _$$_EditAssetCopyWith<_$_EditAsset> get copyWith =>
      throw _privateConstructorUsedError;
}
