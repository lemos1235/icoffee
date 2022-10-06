//
// [Author] lg (https://github.com/lemos1235)
// [Date] 2022/8/22
//
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:icoffee/pages/beans/beans_detail_page.dart';
import 'package:icoffee/pages/beans/new_beans_page.dart';
import 'package:icoffee/pages/login_page.dart';
import 'package:icoffee/pages/main_page.dart';
import 'package:icoffee/pages/splash.dart';
import 'package:icoffee/pages/user/user_detail_page.dart';

abstract class AppRoutes {
  static const splash = '/splash';

  static const home = '/';

  static const login = '/login';

  static const newCoffeeBeans = '/newCoffeeBeans';

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
      path: AppRoutes.newCoffeeBeans,
      name: AppRoutes.newCoffeeBeans,
      builder: (BuildContext context, GoRouterState state) => const NewCoffeeBeansPage(),
    ),
    GoRoute(
      path: AppRoutes.beansDetail,
      name: AppRoutes.beansDetail,
      builder: (BuildContext context, GoRouterState state) => const BeanDetailPage(),
    ),
    GoRoute(
      path: AppRoutes.userDetail,
      name: AppRoutes.userDetail,
      builder: (BuildContext context, GoRouterState state) => const UserDetailPage(),
    ),
  ],
);
