import 'package:asset_manager_flutter/src/screens/authentication/view/sign_in/sign_in_screen.dart';
import 'package:asset_manager_flutter/src/screens/home/view/scaffold_with_bottom_navigation_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../screens/home/model/home_navigation_item.dart';
import 'app_routes.dart';
import 'navigation_items.dart';

enum ARoutes { signIn, home, scanner, forgotPassword, profile, history }

final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {  
  return GoRouter(
    navigatorKey: ACoordinator.navigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/login',

    routes: [
      GoRoute(
          name: ARoutes.signIn.name,
          path: '/login',
          builder: (context, state) => const SignInScreen()),
      ShellRoute(
          navigatorKey: ACoordinator.shellKey,
          builder: (_, state, child) {
            return ScaffoldWithBottomNavigationBar(child: child);
          },
          routes: [
            _bottomNavigationItemBuilder(HomeNavigationItems.items[0], ref),
            _bottomNavigationItemBuilder(HomeNavigationItems.items[1], ref),
            _bottomNavigationItemBuilder(HomeNavigationItems.items[2], ref),
          ])
    ],
  );
});

GoRoute _bottomNavigationItemBuilder(HomeNavigationItem item, Ref ref,
        {List<RouteBase> routes = const <RouteBase>[]}) =>
    GoRoute(
      path: item.path,
      name: item.route.name,
      pageBuilder: (_, __) {
        return NoTransitionPage(
          child: item.view,
        );
      },
      routes: routes,
    );
