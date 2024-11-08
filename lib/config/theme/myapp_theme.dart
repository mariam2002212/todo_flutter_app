import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/text_styles.dart';

class MyAppTheme{
  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.blue,
    primary: ColorsManager.blue,onPrimary: ColorsManager.white),
    scaffoldBackgroundColor: ColorsManager.grey,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.blue,
      titleTextStyle: LightTxtStyles.appBar,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedItemColor: ColorsManager.blue,
      unselectedItemColor: ColorsManager.grey,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(size: 33),
      unselectedIconTheme: IconThemeData(size: 33),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: StadiumBorder(side:BorderSide(color: ColorsManager.white,width: 4.h)),
      backgroundColor: ColorsManager.blue,

    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorsManager.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(12.r),topRight: Radius.circular(12.r)))),
    iconTheme: IconThemeData(
      color: ColorsManager.blue,
      size: 24.sp,
    ),
    cardTheme: CardTheme(
      elevation: 8.h,
        color: ColorsManager.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.r))
    )
  );
  static ThemeData dark = ThemeData(

  );
}