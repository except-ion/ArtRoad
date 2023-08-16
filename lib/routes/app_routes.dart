import 'package:flutter/material.dart';
import 'package:artroad/presentation/basepage_screen/basepage_screen.dart';
import 'package:artroad/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String basepageScreen = '/basepage_screen';

  static const String favoritecalendarPage = '/favoritecalendar_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    basepageScreen: (context) => BasepageScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
