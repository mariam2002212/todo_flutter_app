import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/presentation/home/home_screen.dart';

class RoutesManager{
  static const String homeRoute = '/home';

  //function that returns route object and takes param of routesettings
  static Route? router(RouteSettings settings){
    switch(settings.name){
      case homeRoute:
        return MaterialPageRoute(builder: (context)=> HomeScreen());
    }
  }
}