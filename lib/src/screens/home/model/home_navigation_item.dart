import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../router/coordinatior.dart';

part 'home_navigation_item.freezed.dart';

@freezed
class HomeNavigationItem with _$HomeNavigationItem {
  const factory HomeNavigationItem({
    required ARoutes route,
    required String path,
    required IconData icon,
    required IconData selectedIcon,
    required String tooltip,
    required String label,
    required Widget view,
  }) = _HomeNavigationItem;
}
