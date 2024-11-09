import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/presentation/authentication/login/login.dart';
import 'package:todo/presentation/authentication/register/register.dart';
import 'package:todo/presentation/home/home_screen.dart';

class RoutesManager{
  static const String homeRoute = '/home';
  static const String register = '/register';
  static const String login = '/login';

  //function that returns route object and takes param of routesettings
  static Route? router(RouteSettings settings){
    switch(settings.name){
      case homeRoute:
        return MaterialPageRoute(builder: (context)=> HomeScreen());
      case register:
        return MaterialPageRoute(
          builder: (context) => const Register(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
    }
  }
}