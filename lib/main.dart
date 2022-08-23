//
// [Author] lg (https://github.com/lemos1235)
// [Date] 2022/8/22
//
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:icoffee/app_routes.dart';
import 'package:icoffee/app_theme.dart';
import 'package:icoffee/constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppTheme.bgWhite,
      ),
      child: MaterialApp.router(
        routeInformationProvider: appRouter.routeInformationProvider,
        routeInformationParser: appRouter.routeInformationParser,
        routerDelegate: appRouter.routerDelegate,
        title: Constants.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            platform: TargetPlatform.iOS,
            primaryColor: AppTheme.primary,
            primarySwatch: Colors.brown,
            cardTheme: const CardTheme(shadowColor: Color(0x80DCE7FA)),
            appBarTheme: const AppBarTheme(
                elevation: 2,
                systemOverlayStyle: SystemUiOverlayStyle.dark,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                iconTheme: IconThemeData(
                  size: 20,
                ),
                titleTextStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                )),
            tabBarTheme: const TabBarTheme(
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
            ),
            indicatorColor: Colors.red,
            progressIndicatorTheme: const ProgressIndicatorThemeData(
              color: Colors.white54,
            )),
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
