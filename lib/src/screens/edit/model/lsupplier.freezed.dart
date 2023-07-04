// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lsupplier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LSupplier _$LSupplierFromJson(Map<String, dynamic> json) {
  return _LSupplier.fromJson(json);
}

/// @nodoc
mixin _$LSupplier {
  List<int>? get id => throw _privateConstructorUsedError;
  List<String>? get name => throw _privateConstructorUsedError;
  bool? get error => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LSupplierCopyWith<LSupplier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LSupplierCopyWith<$Res> {
  factory $LSupplierCopyWith(LSupplier value, $Res Function(LSupplier) then) =
      _$LSupplierCopyWithImpl<$Res, LSupplier>;
  @useResult
  $Res call({List<int>? id, List<String>? name, bool? error, String? message});
}

/// @nodoc
class _$LSupplierCopyWithImpl<$Res, $Val extends LSupplier>
    implements $LSupplierCopyWith<$Res> {
  _$LSupplierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LSupplierCopyWith<$Res> implements $LSupplierCopyWith<$Res> {
  factory _$$_LSupplierCopyWith(
          _$_LSupplier value, $Res Function(_$_LSupplier) then) =
      __$$_LSupplierCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int>? id, List<String>? name, bool? error, String? message});
}

/// @nodoc
class __$$_LSupplierCopyWithImpl<$Res>
    extends _$LSupplierCopyWithImpl<$Res, _$_LSupplier>
    implements _$$_LSupplierCopyWith<$Res> {
  __$$_LSupplierCopyWithImpl(
      _$_LSupplier _value, $Res Function(_$_LSupplier) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_LSupplier(
      id: freezed == id
          ? _value._id
          : id // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      name: freezed == name
          ? _value._name
          : name // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LSupplier implements _LSupplier {
  _$_LSupplier(
      {final List<int>? id, final List<String>? name, this.error, this.message})
      : _id = id,
        _name = name;

  factory _$_LSupplier.fromJson(Map<String, dynamic> json) =>
      _$$_LSupplierFromJson(json);

  final List<int>? _id;
  @override
  List<int>? get id {
    final value = _id;
    if (value == null) return null;
    if (_id is EqualUnmodifiableListView) return _id;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _name;
  @override
  List<String>? get name {
    final value = _name;
    if (value == null) return null;
    if (_name is EqualUnmodifiableListView) return _name;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? error;
  @override
  final String? message;

  @override
  String toString() {
    return 'LSupplier(id: $id, name: $name, error: $error, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LSupplier &&
            const DeepCollectionEquality().equals(other._id, _id) &&
            const DeepCollectionEquality().equals(other._name, _name) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_id),
      const DeepCollectionEquality().hash(_name),
      error,
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LSupplierCopyWith<_$_LSupplier> get copyWith =>
      __$$_LSupplierCopyWithImpl<_$_LSupplier>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LSupplierToJson(
      this,
    );
  }
}

abstract class _LSupplier implements LSupplier {
  factory _LSupplier(
      {final List<int>? id,
      final List<String>? name,
      final bool? error,
      final String? message}) = _$_LSupplier;

  factory _LSupplier.fromJson(Map<String, dynamic> json) =
      _$_LSupplier.fromJson;

  @override
  List<int>? get id;
  @override
  List<String>? get name;
  @override
  bool? get error;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_LSupplierCopyWith<_$_LSupplier> get copyWith =>
      throw _privateConstructorUsedError;
}
