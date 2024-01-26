//
// [Author] lg (https://github.com/lemos1235)
// [Date] 2022/8/22
//
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:icoffee2/pages/coffee_beans/coffee_beans_detail_page.dart';
import 'package:icoffee2/pages/coffee_beans/new_coffee_beans_page.dart';
import 'package:icoffee2/pages/login/login_page.dart';
import 'package:icoffee2/pages/main_page.dart';
import 'package:icoffee2/pages/splash.dart';
import 'package:icoffee2/pages/user/user_detail_page.dart';

abstract class AppRoutes {
  static const splash = '/splash';

  static const home = '/';

  static const login = '/login';

  static const newcoffee_beans = '/newcoffee_beans';

  static const beansDetail = '/beansDetail';

  static const userDetail = '/userDetail';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: <GoRoute>[
    GoRoute(
      path: AppRoutes.splash,
      name: AppRoutes.splash,
      builder: (BuildContext context, GoRouterState state) => const SplashPage(),
    ),
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
    GoRoute(
      path: AppRoutes.newcoffee_beans,
      name: AppRoutes.newcoffee_beans,
      builder: (BuildContext context, GoRouterState state) => const NewCoffeeBeansPage(),
    ),
    GoRoute(
      path: AppRoutes.beansDetail,
      name: AppRoutes.beansDetail,
      builder: (BuildContext context, GoRouterState state) => const CoffeeBeansDetailPage(),
    ),
    GoRoute(
      path: AppRoutes.userDetail,
      name: AppRoutes.userDetail,
      builder: (BuildContext context, GoRouterState state) => const UserDetailPage(),
    ),
  ],
);
