import 'package:flutter/material.dart';

// Routes
import 'package:encrypted_counter/screens/bottom_nav_screen.dart';
import 'package:encrypted_counter/screens/intro_screen.dart';
import 'package:encrypted_counter/screens/setting_screen.dart';
import 'package:encrypted_counter/screens/splash_screen.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiate this object

  static const String splash = '/splash';
  static const String intro = '/intro';
  static const String bottom = '/bottom';
  static const String setting = '/setting';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => const SplashScreen(),
    intro: (BuildContext context) => const IntroScreen(),
    bottom: (BuildContext context) => const BottomNavigationScreen(),
    setting: (BuildContext context) => const SettingScreen(),
  };
}
