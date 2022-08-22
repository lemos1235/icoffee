///
/// [Author] lg (https://github.com/lemos1235)
/// [Date] 2022/8/22
///
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:icoffee/pages/login_page.dart';
import 'package:icoffee/pages/nav_pages/main_page.dart';

abstract class AppRoutes {
  static const home = '/';

  static const login = '/login';
}

final GoRouter appRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: AppRoutes.home,
      name: AppRoutes.home,
      builder: (BuildContext context, GoRouterState state) => const MainPage(),
    ),
    GoRoute(
      path: AppRoutes.login,
      name: AppRoutes.login,
      builder: (BuildContext context, GoRouterState state) => const LoginPage(),
    ),
  ],
);
