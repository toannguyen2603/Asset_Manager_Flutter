import 'package:asset_manager_flutter/src/constaints/type_defs/type_defs.dart';

class config {
  static const baseUrl = 'https://masset-api.nhp-tech.com';
  static const login = '/api/Mobile/Login';
  static String assetAPI(UserId id, Tag tag) {
    return '/api/Mobile/GetAsset/${id}/${tag}';
  }

  static String editProperty(UserId id, Tag tag) {
    return '/api/Mobile/UpdateAsset/${id}/${tag}';
  }
}
