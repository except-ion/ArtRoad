import 'package:artroad/core/app_export.dart';
import 'package:artroad/presentation/calendar/favoritecalendar_screen.dart';
import 'package:artroad/presentation/home/home_screen.dart';
import 'package:artroad/presentation/profile/profile_screen.dart';
import 'package:artroad/presentation/search/search_screen.dart';
import 'package:artroad/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class BasepageScreen extends StatelessWidget {
  BasepageScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.homeScreen,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Navigator.pushNamed(
                  navigatorKey.currentContext!, getCurrentRoute(type));
            })));
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreen;
      case BottomBarEnum.Calendar:
        return AppRoutes.favoritecalendarScreen;
      case BottomBarEnum.Search:
        return AppRoutes.searchScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.profileScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.favoritecalendarScreen:
        return FavoritecalendarScreen();
      case AppRoutes.homeScreen:
        return HomeScreen();
      case AppRoutes.profileScreen:
        return ProfileScreen();
      case AppRoutes.searchScreen:
        return SearchScreen();
      default:
        return DefaultWidget();
    }
  }
}