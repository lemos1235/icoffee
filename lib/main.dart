//
// [Author] lg (https://github.com/lemos1235)
// [Date] 2022/8/22
//
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:icoffee/app_routes.dart';
import 'package:icoffee/constants/app_colors.dart';
import 'package:icoffee/constants/constants.dart';
import 'package:icoffee/utils/app_theme_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BrnInitializer.register(allThemeConfig: AppThemeUtils.defaultAllConfig);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
      ),
      child: MaterialApp.router(
        routeInformationProvider: appRouter.routeInformationProvider,
        routeInformationParser: appRouter.routeInformationParser,
        routerDelegate: appRouter.routerDelegate,
        title: Constants.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          platform: TargetPlatform.iOS,
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: AppColors.bgWhite,
          primarySwatch: AppColors.brown,
          cardTheme: const CardTheme(shadowColor: Color(0x80DCE7FA)),
          tabBarTheme: const TabBarTheme(
            labelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
          ),
          indicatorColor: Colors.red,
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: Colors.white54,
          ),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('zh', 'CN'),
        ],
      ),
    );
  }
}
