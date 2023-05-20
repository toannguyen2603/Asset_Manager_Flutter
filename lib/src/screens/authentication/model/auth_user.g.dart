// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LAuthUser _$$_LAuthUserFromJson(Map<String, dynamic> json) => _$_LAuthUser(
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      isActive: json['isActive'] as bool? ?? false,
      firstLogin: json['firstLogin'] as bool? ?? false,
      token: json['token'] as String?,
      createDay: json['createDay'] as String?,
      updateDay: json['updateDay'] as String?,
      role: json['role'] as String?,
      error: json['error'] as bool? ?? true,
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$$_LAuthUserToJson(_$_LAuthUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'isActive': instance.isActive,
      'firstLogin': instance.firstLogin,
      'token': instance.token,
      'createDay': instance.createDay,
      'updateDay': instance.updateDay,
      'role': instance.role,
      'error': instance.error,
      'message': instance.message,
    };
