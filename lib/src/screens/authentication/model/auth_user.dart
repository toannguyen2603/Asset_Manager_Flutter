import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

@freezed
class LAuthUser with _$LAuthUser {
  factory LAuthUser(
      {String? id,
      String? userName,
      String? email,
      String? phoneNumber,
      @Default(false) bool isActive,
      @Default(false) bool firstLogin,
      String? token,
      String? createDay,
      String? updateDay,
      String? role,
      @Default(true) bool error,
      @Default('') String message}) = _LAuthUser;

  factory LAuthUser.fromJson(Map<String, dynamic> json, {String}) =>
      _$LAuthUserFromJson(json);
}
