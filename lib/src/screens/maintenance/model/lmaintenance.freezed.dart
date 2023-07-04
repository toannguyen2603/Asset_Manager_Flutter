// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lmaintenance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LMaintenance _$LMaintenanceFromJson(Map<String, dynamic> json) {
  return _LMaintenance.fromJson(json);
}

/// @nodoc
mixin _$LMaintenance {
  int get id => throw _privateConstructorUsedError;
  String? get asset => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get supplier => throw _privateConstructorUsedError;
  dynamic get type => throw _privateConstructorUsedError;
  dynamic get error => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LMaintenanceCopyWith<LMaintenance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LMaintenanceCopyWith<$Res> {
  factory $LMaintenanceCopyWith(
          LMaintenance value, $Res Function(LMaintenance) then) =
      _$LMaintenanceCopyWithImpl<$Res, LMaintenance>;
  @useResult
  $Res call(
      {int id,
      String? asset,
      String? message,
      String? supplier,
      dynamic type,
      dynamic error,
      DateTime? startDate,
      DateTime? endDate});
}

/// @nodoc
class _$LMaintenanceCopyWithImpl<$Res, $Val extends LMaintenance>
    implements $LMaintenanceCopyWith<$Res> {
  _$LMaintenanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? asset = freezed,
    Object? message = freezed,
    Object? supplier = freezed,
    Object? type = freezed,
    Object? error = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      asset: freezed == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as dynamic,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LMaintenanceCopyWith<$Res>
    implements $LMaintenanceCopyWith<$Res> {
  factory _$$_LMaintenanceCopyWith(
          _$_LMaintenance value, $Res Function(_$_LMaintenance) then) =
      __$$_LMaintenanceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? asset,
      String? message,
      String? supplier,
      dynamic type,
      dynamic error,
      DateTime? startDate,
      DateTime? endDate});
}

/// @nodoc
class __$$_LMaintenanceCopyWithImpl<$Res>
    extends _$LMaintenanceCopyWithImpl<$Res, _$_LMaintenance>
    implements _$$_LMaintenanceCopyWith<$Res> {
  __$$_LMaintenanceCopyWithImpl(
      _$_LMaintenance _value, $Res Function(_$_LMaintenance) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? asset = freezed,
    Object? message = freezed,
    Object? supplier = freezed,
    Object? type = freezed,
    Object? error = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$_LMaintenance(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      asset: freezed == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type ? _value.type! : type,
      error: freezed == error ? _value.error! : error,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LMaintenance implements _LMaintenance {
  _$_LMaintenance(
      {this.id = 0,
      this.asset,
      this.message,
      this.supplier,
      this.type = 0,
      this.error = bool,
      this.startDate,
      this.endDate});

  factory _$_LMaintenance.fromJson(Map<String, dynamic> json) =>
      _$$_LMaintenanceFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final String? asset;
  @override
  final String? message;
  @override
  final String? supplier;
  @override
  @JsonKey()
  final dynamic type;
  @override
  @JsonKey()
  final dynamic error;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;

  @override
  String toString() {
    return 'LMaintenance(id: $id, asset: $asset, message: $message, supplier: $supplier, type: $type, error: $error, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LMaintenance &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.asset, asset) || other.asset == asset) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      asset,
      message,
      supplier,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(error),
      startDate,
      endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LMaintenanceCopyWith<_$_LMaintenance> get copyWith =>
      __$$_LMaintenanceCopyWithImpl<_$_LMaintenance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LMaintenanceToJson(
      this,
    );
  }
}

abstract class _LMaintenance implements LMaintenance {
  factory _LMaintenance(
      {final int id,
      final String? asset,
      final String? message,
      final String? supplier,
      final dynamic type,
      final dynamic error,
      final DateTime? startDate,
      final DateTime? endDate}) = _$_LMaintenance;

  factory _LMaintenance.fromJson(Map<String, dynamic> json) =
      _$_LMaintenance.fromJson;

  @override
  int get id;
  @override
  String? get asset;
  @override
  String? get message;
  @override
  String? get supplier;
  @override
  dynamic get type;
  @override
  dynamic get error;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$_LMaintenanceCopyWith<_$_LMaintenance> get copyWith =>
      throw _privateConstructorUsedError;
}
