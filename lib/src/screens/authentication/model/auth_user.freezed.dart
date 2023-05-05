// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LAuthUser _$LAuthUserFromJson(Map<String, dynamic> json) {
  return _LAuthUser.fromJson(json);
}

/// @nodoc
mixin _$LAuthUser {
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LAuthUserCopyWith<LAuthUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LAuthUserCopyWith<$Res> {
  factory $LAuthUserCopyWith(LAuthUser value, $Res Function(LAuthUser) then) =
      _$LAuthUserCopyWithImpl<$Res, LAuthUser>;
  @useResult
  $Res call({String userName, String password, String? email});
}

/// @nodoc
class _$LAuthUserCopyWithImpl<$Res, $Val extends LAuthUser>
    implements $LAuthUserCopyWith<$Res> {
  _$LAuthUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LAuthUserCopyWith<$Res> implements $LAuthUserCopyWith<$Res> {
  factory _$$_LAuthUserCopyWith(
          _$_LAuthUser value, $Res Function(_$_LAuthUser) then) =
      __$$_LAuthUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, String password, String? email});
}

/// @nodoc
class __$$_LAuthUserCopyWithImpl<$Res>
    extends _$LAuthUserCopyWithImpl<$Res, _$_LAuthUser>
    implements _$$_LAuthUserCopyWith<$Res> {
  __$$_LAuthUserCopyWithImpl(
      _$_LAuthUser _value, $Res Function(_$_LAuthUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
    Object? email = freezed,
  }) {
    return _then(_$_LAuthUser(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LAuthUser implements _LAuthUser {
  _$_LAuthUser({required this.userName, required this.password, this.email});

  factory _$_LAuthUser.fromJson(Map<String, dynamic> json) =>
      _$$_LAuthUserFromJson(json);

  @override
  final String userName;
  @override
  final String password;
  @override
  final String? email;

  @override
  String toString() {
    return 'LAuthUser(userName: $userName, password: $password, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LAuthUser &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userName, password, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LAuthUserCopyWith<_$_LAuthUser> get copyWith =>
      __$$_LAuthUserCopyWithImpl<_$_LAuthUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LAuthUserToJson(
      this,
    );
  }
}

abstract class _LAuthUser implements LAuthUser {
  factory _LAuthUser(
      {required final String userName,
      required final String password,
      final String? email}) = _$_LAuthUser;

  factory _LAuthUser.fromJson(Map<String, dynamic> json) =
      _$_LAuthUser.fromJson;

  @override
  String get userName;
  @override
  String get password;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$_LAuthUserCopyWith<_$_LAuthUser> get copyWith =>
      throw _privateConstructorUsedError;
}
