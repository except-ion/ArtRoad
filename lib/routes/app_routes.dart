import 'package:artroad/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:artroad/presentation/basepage_screen/basepage_screen.dart';
import 'package:artroad/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String basepageScreen = '/basepage_screen';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String loginScreen = '/login_screen';

  static const String favoritecalendarScreen = '/favoritecalendar_screen';
  static const String searchScreen = '/search_screen';
  static const String homeScreen = '/home_screen';
  static const String profileScreen = '/profile_screen';

  static Map<String, WidgetBuilder> routes = {
    basepageScreen: (context) => BasepageScreen(),
    loginScreen:(context) => LoginScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
