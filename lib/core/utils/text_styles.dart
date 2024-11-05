import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/utils/colors_manager.dart';

class LightTxtStyles {
  static TextStyle appBar = GoogleFonts.poppins(fontSize: 22.sp,fontWeight: FontWeight.w700, color: ColorsManager.white,);
  static TextStyle settingsTabLabel = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w700, color: ColorsManager.black);
  static TextStyle selectedItemLabel = GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: ColorsManager.blue);
}