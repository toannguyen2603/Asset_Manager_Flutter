import 'package:asset_manager_flutter/src/screens/authentication/model/auth_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserManager {
  UserManager();

  final String name = 'com.name.manager.userId';
  final String phone = 'com.phone.manager.userId';
  final String email = 'com.email.manager.userId';
  final String role = 'com.role.manager.userId';

  late final SharedPreferences prefs;

  Future<void> setInfoUser(LAuthUser user) async {
    print('Data of user: ${user}');
    prefs = await SharedPreferences.getInstance();
    prefs.setString(email, user.email ?? '');
    prefs.setString(phone, user.phoneNumber ?? '');
    prefs.setString(role, user.role ?? '');
    prefs.setString(name, user.userName ?? '');
  }

  Future<LAuthUser> getEmail() async {
    prefs = await SharedPreferences.getInstance();
    String? phone;
    String? role;
    String? name;
    String? email;
    email = prefs.getString(this.email);
    role = prefs.getString(this.role);
    name = prefs.getString(this.name);
    phone = prefs.getString(this.phone);
    return LAuthUser(
      email: email,
      role: role,
      userName: name,
      phoneNumber: phone,
    );
  }
}
