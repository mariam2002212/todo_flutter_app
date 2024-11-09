import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/utils/colors_manager.dart';

class LightTxtStyles {
  static TextStyle appBar = GoogleFonts.poppins(fontSize: 22.sp,fontWeight: FontWeight.w700, color: ColorsManager.white,);
  static TextStyle settingsTabLabel = GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w700, color: ColorsManager.black);
  static TextStyle selectedItemLabel = GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w400, color: ColorsManager.blue);
  static TextStyle bottomSheetTitle = GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w700, color: ColorsManager.blackAccent);
  static TextStyle bottomSheetHintText = GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w400, color: ColorsManager.greyAccent);
  static TextStyle selectDate = GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w400, color: ColorsManager.blackAccent);
  static TextStyle taskWidgetTitle = GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w700, color: ColorsManager.blue);
  static TextStyle taskWidgetDescription = GoogleFonts.roboto(fontSize: 12.sp, fontWeight: FontWeight.w400, color: ColorsManager.lightDark);
  static TextStyle selectedCalenderText = GoogleFonts.roboto(fontSize: 15.sp, fontWeight: FontWeight.w700, color: ColorsManager.blue);
  static TextStyle unselectedCalenderText = GoogleFonts.roboto(fontSize: 15.sp, fontWeight: FontWeight.w700, color: ColorsManager.lightDark);
  static TextStyle hintRegister = GoogleFonts.roboto(fontSize: 14.sp,fontWeight: FontWeight.w300,color: ColorsManager.greyAccent);
  static TextStyle title = GoogleFonts.roboto(fontSize: 18.sp,fontWeight:FontWeight.w500,color: ColorsManager.white);
  static TextStyle buttonText = GoogleFonts.roboto(fontSize:20.sp,fontWeight:FontWeight.w600,color:Colors.blue.shade900);

}
