import 'package:artroad/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      title: 'artroad',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.basepageScreen,
      routes: AppRoutes.routes,
    );
  }
}