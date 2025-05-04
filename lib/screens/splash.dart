//
// [Author] lg (https://github.com/lemos1235)
// [Date] 2022/8/22
//
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icoffee/app_routes.dart';
import 'package:icoffee/app_colors.dart';

/// 闪屏页
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    var isLogin = checkIsLogin();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      GoRouter.of(context).goNamed(isLogin ? AppRoutes.home : AppRoutes.login);
    });
  }

  bool checkIsLogin() {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgWhite,
    );
  }
}
