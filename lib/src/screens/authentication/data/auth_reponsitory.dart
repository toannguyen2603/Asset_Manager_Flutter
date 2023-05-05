import 'dart:convert';

import '../model/auth_user.dart';

abstract class AuthenticationRepository {
  Future<LAuthUser> signIn({
    required String email,
    required String password,
  });
  Future<void> signOut();

  Future<void> resetPassword(String email);
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}

@override
Future<LAuthUser> signIn({
  required String userName,
  required String password,
}) async {
  var jsonData = await {'userName': userName, 'password': password};
  return LAuthUser.fromJson(jsonData);
}
