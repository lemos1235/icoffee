//
// [Author] lg (https://github.com/lemos1235)
// [Date] 2022/8/22
//
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:icoffee/app_routes.dart';
import 'package:icoffee/app_theme.dart';
import 'package:icoffee/app_colors.dart';
import 'package:icoffee/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BrnInitializer.register(allThemeConfig: AppThemeUtils.theme);
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
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
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
        builder: (context, child) => Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            child: child,
          ),
        ),
      ),
    );
  }
}
