import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/home/model/home_navigation_item.dart';
import '../screens/home/view/home_view.dart';
import '../screens/profile/view/profile_view.dart';
import '../screens/scan/view/scan_view.dart';
import 'coordinatior.dart';

class HomeNavigationItems {
  static const home = HomeNavigationItem(
    route: ARoutes.home,
    path: '/home',
    icon: FontAwesomeIcons.star,
    selectedIcon: FontAwesomeIcons.solidStar,
    tooltip: 'Home',
    label: 'Home',
    view: HomeView(),
  );

  static const scan = HomeNavigationItem(
    route: ARoutes.scanner,
    path: '/scan',
    icon: FontAwesomeIcons.qrcode,
    selectedIcon: FontAwesomeIcons.qrcode,
    tooltip: 'Scan',
    label: 'Scan',
    view: ScannerView(),
  );

  static const profile = HomeNavigationItem(
    route: ARoutes.profile,
    path: '/profile',
    icon: FontAwesomeIcons.circleUser,
    selectedIcon: FontAwesomeIcons.solidCircleUser,
    tooltip: 'Account',
    label: 'Account',
    view: ProfileView(),
  );

  static const items = <HomeNavigationItem>[
    home,
    scan,
    profile,
  ];
}
