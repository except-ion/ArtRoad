import 'package:artroad/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:artroad/src/provider/condetail_provider.dart';
import 'package:artroad/src/provider/facdetail_provider.dart';
import 'package:artroad/src/provider/ranking_provider.dart';
import 'package:artroad/src/provider/search/concert_provider.dart';
import 'package:artroad/src/provider/calendar/concert_provider.dart';
import 'package:artroad/src/provider/search/facility_provider.dart';
import 'package:artroad/src/home.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ConcertSearchProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ConcertCalendarProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => FacilityProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ConcertDetailProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => FacilityDetailProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => RankingProvider(),
      ),
    ],
    child: MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      title: 'artroad',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginScreen,
      routes: AppRoutes.routes,
      home: Home(), 
    ),
  );
}