import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

@freezed
class LAuthUser with _$LAuthUser {
  factory LAuthUser(
      {required String userName,
      required String password,
      String? email}) = _LAuthUser;

  factory LAuthUser.fromJson(Map<String, dynamic> json, {String}) =>
      _$LAuthUserFromJson(json);
}
