import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/utils/assets_manager.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/routes_manager.dart';
import 'package:todo/presentation/authentication/register/register.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // SvgPicture.asset(
              //   AssetsManager.logo,
              //   width: 189.w,
              //   height: 211.h,
              // ),

              SvgPicture.asset(
                AssetsManager.route,
                width: 120.w,
                height: 120.h,
                color: ColorsManager.blue,
              ),

            ],
          ),
        ),
        nextScreen: const Register());
  }
}
