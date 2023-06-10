import 'package:asset_manager_flutter/src/constaints/type_defs/type_defs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  final String key = 'com.asset.manager.userId';
  late final SharedPreferences prefs;

  Future<void> setUserId(UserId id) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(key, id);
  }

  Future<String?> getUserId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId;
    userId = (pref.getString(this.key) ?? null);
    return userId;
  }

  clearAll() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
