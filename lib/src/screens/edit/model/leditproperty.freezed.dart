// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leditproperty.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LEditProperty _$LEditPropertyFromJson(Map<String, dynamic> json) {
  return _LEditProperty.fromJson(json);
}

/// @nodoc
mixin _$LEditProperty {
  int get status => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LEditPropertyCopyWith<LEditProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LEditPropertyCopyWith<$Res> {
  factory $LEditPropertyCopyWith(
          LEditProperty value, $Res Function(LEditProperty) then) =
      _$LEditPropertyCopyWithImpl<$Res, LEditProperty>;
  @useResult
  $Res call({int status, String? description});
}

/// @nodoc
class _$LEditPropertyCopyWithImpl<$Res, $Val extends LEditProperty>
    implements $LEditPropertyCopyWith<$Res> {
  _$LEditPropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LEditPropertyCopyWith<$Res>
    implements $LEditPropertyCopyWith<$Res> {
  factory _$$_LEditPropertyCopyWith(
          _$_LEditProperty value, $Res Function(_$_LEditProperty) then) =
      __$$_LEditPropertyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int status, String? description});
}

/// @nodoc
class __$$_LEditPropertyCopyWithImpl<$Res>
    extends _$LEditPropertyCopyWithImpl<$Res, _$_LEditProperty>
    implements _$$_LEditPropertyCopyWith<$Res> {
  __$$_LEditPropertyCopyWithImpl(
      _$_LEditProperty _value, $Res Function(_$_LEditProperty) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? description = freezed,
  }) {
    return _then(_$_LEditProperty(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LEditProperty implements _LEditProperty {
  _$_LEditProperty({this.status = 1, this.description});

  factory _$_LEditProperty.fromJson(Map<String, dynamic> json) =>
      _$$_LEditPropertyFromJson(json);

  @override
  @JsonKey()
  final int status;
  @override
  final String? description;

  @override
  String toString() {
    return 'LEditProperty(status: $status, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LEditProperty &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LEditPropertyCopyWith<_$_LEditProperty> get copyWith =>
      __$$_LEditPropertyCopyWithImpl<_$_LEditProperty>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LEditPropertyToJson(
      this,
    );
  }
}

abstract class _LEditProperty implements LEditProperty {
  factory _LEditProperty({final int status, final String? description}) =
      _$_LEditProperty;

  factory _LEditProperty.fromJson(Map<String, dynamic> json) =
      _$_LEditProperty.fromJson;

  @override
  int get status;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_LEditPropertyCopyWith<_$_LEditProperty> get copyWith =>
      throw _privateConstructorUsedError;
}
