
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/config/theme/myapp_theme.dart';
import 'package:todo/core/utils/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: Size(412,870),
      minTextAdapt: true,
      splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RoutesManager.router,
            initialRoute: RoutesManager.homeRoute,
            theme: MyAppTheme.light,
            darkTheme: MyAppTheme.dark,
            themeMode: ThemeMode.light,
          );
        },
     // builder: (context, child) =>const MaterialApp()
    );
  }
}