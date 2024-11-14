import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/config/theme/myapp_theme.dart';
import 'package:todo/core/utils/routes_manager.dart';
import 'package:todo/presentation/home/tabs/settings/settings_tab.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void switchTheme(ThemeMode themeMode) {
    print('switchTheme function called');
    if (_themeMode != themeMode) {
      setState(() {
        _themeMode = themeMode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesManager.router,
          initialRoute: RoutesManager.splash,
          theme: MyAppTheme.light,
          darkTheme: MyAppTheme.dark,
          themeMode: _themeMode,
          home: SettingsTab(switchTheme: switchTheme),
        );
      },
    );
  }
}
